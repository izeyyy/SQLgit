CREATE TABLE [dbo].[umbracoUserGroup2NodePermission] (
  [userGroupId] [int] NOT NULL,
  [nodeId] [int] NOT NULL,
  [permission] [nvarchar](255) NOT NULL,
  CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED ([userGroupId], [nodeId], [permission])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoUser2NodePermission_nodeId]
  ON [dbo].[umbracoUserGroup2NodePermission] ([nodeId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]
  ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]
  ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [dbo].[umbracoUserGroup] ([id])
GO