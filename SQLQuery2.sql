-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/31/2022 22:38:07
-- Generated from EDMX file: C:\Users\cleboeuf\source\repos\FernAndFallowWebsite\FernAndFallowWebsite\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DefaultConnection];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [WishList_Id] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Quantity] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [ProductCatergoriesId] int  NOT NULL,
    [WishListItemId] int  NOT NULL,
    [Image] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'WishLists'
CREATE TABLE [dbo].[WishLists] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Quotes'
CREATE TABLE [dbo].[Quotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [AdminId] int  NOT NULL,
    [CustomerId] int  NOT NULL,
    [WishListId] int  NOT NULL
);
GO

-- Creating table 'ProductCatergories'
CREATE TABLE [dbo].[ProductCatergories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Guests'
CREATE TABLE [dbo].[Guests] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'WishListItems'
CREATE TABLE [dbo].[WishListItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [QuantityRequest] nvarchar(max)  NOT NULL,
    [UnitCost] nvarchar(max)  NOT NULL,
    [SubTotal] nvarchar(max)  NOT NULL,
    [WishListId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WishLists'
ALTER TABLE [dbo].[WishLists]
ADD CONSTRAINT [PK_WishLists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [PK_Quotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductCatergories'
ALTER TABLE [dbo].[ProductCatergories]
ADD CONSTRAINT [PK_ProductCatergories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Guests'
ALTER TABLE [dbo].[Guests]
ADD CONSTRAINT [PK_Guests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WishListItems'
ALTER TABLE [dbo].[WishListItems]
ADD CONSTRAINT [PK_WishListItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdminId] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [FK_AdminQuote]
    FOREIGN KEY ([AdminId])
    REFERENCES [dbo].[Admins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdminQuote'
CREATE INDEX [IX_FK_AdminQuote]
ON [dbo].[Quotes]
    ([AdminId]);
GO

-- Creating foreign key on [ProductCatergoriesId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ProductCatergoriesProduct]
    FOREIGN KEY ([ProductCatergoriesId])
    REFERENCES [dbo].[ProductCatergories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCatergoriesProduct'
CREATE INDEX [IX_FK_ProductCatergoriesProduct]
ON [dbo].[Products]
    ([ProductCatergoriesId]);
GO

-- Creating foreign key on [WishList_Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_CustomerWishList]
    FOREIGN KEY ([WishList_Id])
    REFERENCES [dbo].[WishLists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerWishList'
CREATE INDEX [IX_FK_CustomerWishList]
ON [dbo].[Customers]
    ([WishList_Id]);
GO

-- Creating foreign key on [CustomerId] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [FK_CustomerQuote]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerQuote'
CREATE INDEX [IX_FK_CustomerQuote]
ON [dbo].[Quotes]
    ([CustomerId]);
GO

-- Creating foreign key on [WishListItemId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_WishListItemProduct]
    FOREIGN KEY ([WishListItemId])
    REFERENCES [dbo].[WishListItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WishListItemProduct'
CREATE INDEX [IX_FK_WishListItemProduct]
ON [dbo].[Products]
    ([WishListItemId]);
GO

-- Creating foreign key on [WishListId] in table 'WishListItems'
ALTER TABLE [dbo].[WishListItems]
ADD CONSTRAINT [FK_WishListWishListItem]
    FOREIGN KEY ([WishListId])
    REFERENCES [dbo].[WishLists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WishListWishListItem'
CREATE INDEX [IX_FK_WishListWishListItem]
ON [dbo].[WishListItems]
    ([WishListId]);
GO

-- Creating foreign key on [WishListId] in table 'Quotes'
ALTER TABLE [dbo].[Quotes]
ADD CONSTRAINT [FK_WishListQuote]
    FOREIGN KEY ([WishListId])
    REFERENCES [dbo].[WishLists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WishListQuote'
CREATE INDEX [IX_FK_WishListQuote]
ON [dbo].[Quotes]
    ([WishListId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
