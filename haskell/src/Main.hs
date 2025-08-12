{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Aeson
import Data.Text (Text)
import Data.Time.Clock (getCurrentTime)
import Data.Time.Format (formatTime, defaultTimeLocale)
import GHC.Generics
import Network.HTTP.Client (newManager, defaultManagerSettings)
import Network.Wai.Handler.Warp (run)
import Servant
import Servant.API
import Servant.Client
import Servant.Server
import Control.Monad.IO.Class (liftIO)
import Database.PostgreSQL.Simple (connectPostgreSQL)

-- Data models
data User = User
  { userId :: Int
  , userName :: Text
  , userEmail :: Text
  } deriving (Eq, Show, Generic)

instance ToJSON User
instance FromJSON User

data Status = Status
  { status :: Text
  , timestamp :: Text
  } deriving (Eq, Show, Generic)

instance ToJSON Status
instance FromJSON Status

data ExternalPost = ExternalPost
  { postId :: Int
  , postTitle :: Text
  , postBody :: Text
  , postUserId :: Int
  } deriving (Eq, Show, Generic)

instance ToJSON ExternalPost
instance FromJSON ExternalPost where
  parseJSON = withObject "ExternalPost" $ \v -> ExternalPost
    <$> v .: "id"
    <*> v .: "title"
    <*> v .: "body"
    <*> v .: "userId"

-- API definition
type API = 
       "api" :> "users" :> Get '[JSON] [User]
  :<|> "api" :> "status" :> Get '[JSON] Status
  :<|> "api" :> "external" :> Get '[JSON] ExternalPost
  :<|> Get '[PlainText] Text

-- Server implementation
server :: Server API
server = getUsers :<|> getStatus :<|> getExternalPost :<|> getRoot
  where
    getUsers :: Handler [User]
    getUsers = return
      [ User 1 "Alice" "alice@example.com"
      , User 2 "Bob" "bob@example.com"
      , User 3 "Charlie" "charlie@example.com"
      ]

    getStatus :: Handler Status
    getStatus = do
      currentTime <- liftIO getCurrentTime
      let formattedTime = formatTime defaultTimeLocale "%Y-%m-%d %H:%M:%S" currentTime
      return $ Status "OK" (Text.pack formattedTime)

    getExternalPost :: Handler ExternalPost
    getExternalPost = do
      manager <- liftIO $ newManager defaultManagerSettings
      let baseUrl = BaseUrl Http "jsonplaceholder.typicode.com" 80 ""
      let clientM = client (Proxy :: Proxy (Get '[JSON] ExternalPost))
      result <- liftIO $ runClientM clientM (ClientEnv manager baseUrl Nothing)
      case result of
        Left err -> throwError err500 { errBody = "Failed to fetch external post" }
        Right post -> return post

    getRoot :: Handler Text
    getRoot = return "SBOM Test Haskell App is running!"

-- External API client
type ExternalAPI = "posts" :> Capture "id" Int :> Get '[JSON] ExternalPost

client :: ClientM ExternalPost
client = client' (Proxy :: Proxy ExternalAPI) 1
  where
    client' :: Proxy ExternalAPI -> ClientM ExternalPost
    client' = client

-- Main application
main :: IO ()
main = do
  putStrLn "Starting SBOM Test Haskell application on port 8081"
  -- Try to connect to PostgreSQL but don't fail if not available
  _ <- tryConnect
  run 8081 (serve (Proxy :: Proxy API) server)
  where
    tryConnect = do
      putStrLn "Attempting to connect to PostgreSQL (will continue if fails)"
      catch (do
          conn <- connectPostgreSQL "host=localhost dbname=test user=postgres password=postgres"
          putStrLn "Connected to PostgreSQL"
          return (Just conn)
        ) (\e -> do
          putStrLn $ "PostgreSQL connection failed: " ++ show (e :: SomeException)
          return Nothing
        )

-- Error handling
catch :: IO a -> (SomeException -> IO a) -> IO a
catch = Control.Exception.catch
