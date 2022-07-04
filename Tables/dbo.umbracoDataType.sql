CREATE TABLE [dbo].[umbracoDataType] (
  [nodeId] [int] NOT NULL,
  [propertyEditorAlias] [nvarchar](255) NOT NULL,
  [dbType] [nvarchar](50) NOT NULL,
  [config] [ntext] NULL,
  CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED ([nodeId])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoDataType]
  ADD CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO