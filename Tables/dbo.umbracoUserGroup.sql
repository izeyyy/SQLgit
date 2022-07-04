CREATE TABLE [dbo].[umbracoUserGroup] (
  [id] [int] IDENTITY,
  [userGroupAlias] [nvarchar](200) NOT NULL,
  [userGroupName] [nvarchar](200) NOT NULL,
  [userGroupDefaultPermissions] [nvarchar](50) NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoUserGroup_createDate] DEFAULT (getdate()),
  [updateDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoUserGroup_updateDate] DEFAULT (getdate()),
  [icon] [nvarchar](255) NULL,
  [startContentId] [int] NULL,
  [startMediaId] [int] NULL,
  CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupAlias]
  ON [dbo].[umbracoUserGroup] ([userGroupAlias])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupName]
  ON [dbo].[umbracoUserGroup] ([userGroupName])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUserGroup]
  ADD CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY ([startContentId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoUserGroup]
  ADD CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY ([startMediaId]) REFERENCES [dbo].[umbracoNode] ([id])
GO