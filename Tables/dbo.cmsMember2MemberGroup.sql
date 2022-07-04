CREATE TABLE [dbo].[cmsMember2MemberGroup] (
  [Member] [int] NOT NULL,
  [MemberGroup] [int] NOT NULL,
  CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED ([Member], [MemberGroup])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsMember2MemberGroup]
  ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [dbo].[cmsMember] ([nodeId])
GO

ALTER TABLE [dbo].[cmsMember2MemberGroup]
  ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [dbo].[umbracoNode] ([id])
GO