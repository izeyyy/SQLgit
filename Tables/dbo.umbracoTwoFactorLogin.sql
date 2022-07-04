CREATE TABLE [dbo].[umbracoTwoFactorLogin] (
  [id] [int] IDENTITY,
  [userOrMemberKey] [uniqueidentifier] NOT NULL,
  [providerName] [nvarchar](400) NOT NULL,
  [secret] [nvarchar](400) NOT NULL,
  CONSTRAINT [PK_umbracoTwoFactorLogin] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoTwoFactorLogin_ProviderName]
  ON [dbo].[umbracoTwoFactorLogin] ([providerName], [userOrMemberKey])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoTwoFactorLogin_userOrMemberKey]
  ON [dbo].[umbracoTwoFactorLogin] ([userOrMemberKey])
  ON [PRIMARY]
GO