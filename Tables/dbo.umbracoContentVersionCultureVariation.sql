CREATE TABLE [dbo].[umbracoContentVersionCultureVariation] (
  [id] [int] IDENTITY,
  [versionId] [int] NOT NULL,
  [languageId] [int] NOT NULL,
  [name] [nvarchar](255) NOT NULL,
  [date] [datetime] NOT NULL,
  [availableUserId] [int] NULL,
  CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoContentVersionCultureVariation_LanguageId]
  ON [dbo].[umbracoContentVersionCultureVariation] ([languageId])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoContentVersionCultureVariation_VersionId]
  ON [dbo].[umbracoContentVersionCultureVariation] ([versionId], [languageId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]
  ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY ([versionId]) REFERENCES [dbo].[umbracoContentVersion] ([id])
GO

ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]
  ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO

ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]
  ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY ([availableUserId]) REFERENCES [dbo].[umbracoUser] ([id])
GO