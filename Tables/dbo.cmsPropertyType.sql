CREATE TABLE [dbo].[cmsPropertyType] (
  [id] [int] IDENTITY,
  [dataTypeId] [int] NOT NULL,
  [contentTypeId] [int] NOT NULL,
  [propertyTypeGroupId] [int] NULL,
  [Alias] [nvarchar](255) NOT NULL,
  [Name] [nvarchar](255) NULL,
  [sortOrder] [int] NOT NULL CONSTRAINT [DF_cmsPropertyType_sortOrder] DEFAULT ('0'),
  [mandatory] [bit] NOT NULL CONSTRAINT [DF_cmsPropertyType_mandatory] DEFAULT ('0'),
  [mandatoryMessage] [nvarchar](500) NULL,
  [validationRegExp] [nvarchar](255) NULL,
  [validationRegExpMessage] [nvarchar](500) NULL,
  [Description] [nvarchar](2000) NULL,
  [labelOnTop] [bit] NOT NULL CONSTRAINT [DF_cmsPropertyType_labelOnTop] DEFAULT ('0'),
  [variations] [int] NOT NULL CONSTRAINT [DF_cmsPropertyType_variations] DEFAULT ('1'),
  [UniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyType_UniqueID] DEFAULT (newid()),
  CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_cmsPropertyTypeAlias]
  ON [dbo].[cmsPropertyType] ([Alias])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsPropertyTypeUniqueID]
  ON [dbo].[cmsPropertyType] ([UniqueID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsPropertyType]
  ADD CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY ([contentTypeId]) REFERENCES [dbo].[cmsContentType] ([nodeId])
GO

ALTER TABLE [dbo].[cmsPropertyType]
  ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO

ALTER TABLE [dbo].[cmsPropertyType]
  ADD CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY ([dataTypeId]) REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO