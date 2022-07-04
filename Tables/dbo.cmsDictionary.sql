CREATE TABLE [dbo].[cmsDictionary] (
  [pk] [int] IDENTITY,
  [id] [uniqueidentifier] NOT NULL,
  [parent] [uniqueidentifier] NULL,
  [key] [nvarchar](450) NOT NULL,
  CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED ([pk])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsDictionary_id]
  ON [dbo].[cmsDictionary] ([id])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_cmsDictionary_key]
  ON [dbo].[cmsDictionary] ([key])
  ON [PRIMARY]
GO

CREATE INDEX [IX_cmsDictionary_Parent]
  ON [dbo].[cmsDictionary] ([parent])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsDictionary]
  ADD CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY ([parent]) REFERENCES [dbo].[cmsDictionary] ([id])
GO