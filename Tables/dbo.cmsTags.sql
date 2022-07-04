CREATE TABLE [dbo].[cmsTags] (
  [id] [int] IDENTITY,
  [group] [nvarchar](100) NOT NULL,
  [languageId] [int] NULL,
  [tag] [nvarchar](200) NOT NULL,
  CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsTags]
  ON [dbo].[cmsTags] ([group], [tag], [languageId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_cmsTags_LanguageId]
  ON [dbo].[cmsTags] ([languageId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsTags]
  ADD CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO