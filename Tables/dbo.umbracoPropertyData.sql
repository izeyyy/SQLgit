CREATE TABLE [dbo].[umbracoPropertyData] (
  [id] [int] IDENTITY,
  [versionId] [int] NOT NULL,
  [propertyTypeId] [int] NOT NULL,
  [languageId] [int] NULL,
  [segment] [nvarchar](256) NULL,
  [intValue] [int] NULL,
  [decimalValue] [decimal](38, 6) NULL,
  [dateValue] [datetime] NULL,
  [varcharValue] [nvarchar](512) NULL,
  [textValue] [ntext] NULL,
  CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoPropertyData_LanguageId]
  ON [dbo].[umbracoPropertyData] ([languageId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoPropertyData_PropertyTypeId]
  ON [dbo].[umbracoPropertyData] ([propertyTypeId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoPropertyData_Segment]
  ON [dbo].[umbracoPropertyData] ([segment])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoPropertyData_VersionId]
  ON [dbo].[umbracoPropertyData] ([versionId], [propertyTypeId], [languageId], [segment])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoPropertyData]
  ADD CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertyTypeId]) REFERENCES [dbo].[cmsPropertyType] ([id])
GO

ALTER TABLE [dbo].[umbracoPropertyData]
  ADD CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY ([versionId]) REFERENCES [dbo].[umbracoContentVersion] ([id])
GO

ALTER TABLE [dbo].[umbracoPropertyData]
  ADD CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [dbo].[umbracoLanguage] ([id])
GO