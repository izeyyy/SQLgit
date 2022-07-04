CREATE TABLE [dbo].[umbracoExternalLoginToken] (
  [id] [int] IDENTITY,
  [externalLoginId] [int] NOT NULL,
  [name] [nvarchar](255) NOT NULL,
  [value] [nvarchar](max) NOT NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoExternalLoginToken_createDate] DEFAULT (getdate()),
  CONSTRAINT [PK_umbracoExternalLoginToken] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoExternalLoginToken_Name]
  ON [dbo].[umbracoExternalLoginToken] ([externalLoginId], [name])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoExternalLoginToken]
  ADD CONSTRAINT [FK_umbracoExternalLoginToken_umbracoExternalLogin_id] FOREIGN KEY ([externalLoginId]) REFERENCES [dbo].[umbracoExternalLogin] ([id])
GO