CREATE TABLE [dbo].[cmsLanguageText] (
  [pk] [int] IDENTITY,
  [languageId] [int] NOT NULL,
  [UniqueId] [uniqueidentifier] NOT NULL,
  [value] [nvarchar](1000) NOT NULL,
  CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED ([pk])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsLanguageText_languageId]
  ON [dbo].[cmsLanguageText] ([languageId], [UniqueId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsLanguageText]
  ADD CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY ([UniqueId]) REFERENCES [dbo].[cmsDictionary] ([id])
GO

ALTER TABLE [dbo].[cmsLanguageText]
  ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO