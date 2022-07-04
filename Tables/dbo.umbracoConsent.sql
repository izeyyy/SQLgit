CREATE TABLE [dbo].[umbracoConsent] (
  [id] [int] IDENTITY,
  [current] [bit] NOT NULL,
  [source] [nvarchar](512) NOT NULL,
  [context] [nvarchar](128) NOT NULL,
  [action] [nvarchar](512) NOT NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoConsent_createDate] DEFAULT (getdate()),
  [state] [int] NOT NULL,
  [comment] [nvarchar](255) NULL,
  CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO