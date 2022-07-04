CREATE TABLE [dbo].[umbracoUserGroup2Node] (
  [userGroupId] [int] NOT NULL,
  [nodeId] [int] NOT NULL,
  CONSTRAINT [PK_umbracoUserGroup2Node] PRIMARY KEY CLUSTERED ([userGroupId], [nodeId])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoUserGroup2Node_nodeId]
  ON [dbo].[umbracoUserGroup2Node] ([nodeId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUserGroup2Node]
  ADD CONSTRAINT [FK_umbracoUserGroup2Node_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoUserGroup2Node]
  ADD CONSTRAINT [FK_umbracoUserGroup2Node_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [dbo].[umbracoUserGroup] ([id])
GO