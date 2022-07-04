CREATE TABLE [dbo].[umbracoLanguage] (
  [id] [int] IDENTITY,
  [languageISOCode] [nvarchar](14) NULL,
  [languageCultureName] [nvarchar](100) NULL,
  [isDefaultVariantLang] [bit] NOT NULL CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang] DEFAULT ('0'),
  [mandatory] [bit] NOT NULL CONSTRAINT [DF_umbracoLanguage_mandatory] DEFAULT ('0'),
  [fallbackLanguageId] [int] NULL,
  CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoLanguage_fallbackLanguageId]
  ON [dbo].[umbracoLanguage] ([fallbackLanguageId])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoLanguage_languageISOCode]
  ON [dbo].[umbracoLanguage] ([languageISOCode])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoLanguage]
  ADD CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY ([fallbackLanguageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO