CREATE TABLE [dbo].[cmsContentType] (
  [pk] [int] IDENTITY,
  [nodeId] [int] NOT NULL,
  [alias] [nvarchar](255) NULL,
  [icon] [nvarchar](255) NULL,
  [thumbnail] [nvarchar](255) NOT NULL CONSTRAINT [DF_cmsContentType_thumbnail] DEFAULT ('folder.png'),
  [description] [nvarchar](1500) NULL,
  [isContainer] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_isContainer] DEFAULT ('0'),
  [isElement] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_isElement] DEFAULT ('0'),
  [allowAtRoot] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_allowAtRoot] DEFAULT ('0'),
  [variations] [int] NOT NULL CONSTRAINT [DF_cmsContentType_variations] DEFAULT ('1'),
  CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED ([pk])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsContentType]
  ON [dbo].[cmsContentType] ([nodeId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_cmsContentType_icon]
  ON [dbo].[cmsContentType] ([icon])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsContentType]
  ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO