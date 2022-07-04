CREATE TABLE [dbo].[umbracoExternalLogin] (
  [id] [int] IDENTITY,
  [userOrMemberKey] [uniqueidentifier] NOT NULL,
  [loginProvider] [nvarchar](400) NOT NULL,
  [providerKey] [nvarchar](4000) NOT NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoExternalLogin_createDate] DEFAULT (getdate()),
  [userData] [ntext] NULL,
  CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoExternalLogin_LoginProvider]
  ON [dbo].[umbracoExternalLogin] ([loginProvider], [userOrMemberKey])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoExternalLogin_ProviderKey]
  ON [dbo].[umbracoExternalLogin] ([loginProvider], [providerKey])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoExternalLogin_userOrMemberKey]
  ON [dbo].[umbracoExternalLogin] ([userOrMemberKey])
  ON [PRIMARY]
GO