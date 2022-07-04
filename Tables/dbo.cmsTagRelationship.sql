CREATE TABLE [dbo].[cmsTagRelationship] (
  [nodeId] [int] NOT NULL,
  [tagId] [int] NOT NULL,
  [propertyTypeId] [int] NOT NULL,
  CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED ([nodeId], [propertyTypeId], [tagId])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsTagRelationship]
  ADD CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId])
GO

ALTER TABLE [dbo].[cmsTagRelationship]
  ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [dbo].[cmsPropertyType] ([id])
GO

ALTER TABLE [dbo].[cmsTagRelationship]
  ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [dbo].[cmsTags] ([id])
GO