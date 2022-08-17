
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/31/2022 22:38:07
-- Generated from EDMX file: C:\Users\cleboeuf\source\repos\FernAndFallowWebsite\FernAndFallowWebsite\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FernAndFallowDB];
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

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Quantity] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [ProductCategoriesId] int  NOT NULL,
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
    [WishListId] int  NOT NULL
);
GO

-- Creating table 'ProductCategories'
CREATE TABLE [dbo].[ProductCategories] (
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

-- Creating primary key on [Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [PK_ProductCategories]
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

-- Creating foreign key on [ProductCategoriesId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ProductCategoriesProduct]
    FOREIGN KEY ([ProductCategoriesId])
    REFERENCES [dbo].[ProductCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategoriesProduct'
CREATE INDEX [IX_FK_ProductCategoriesProduct]
ON [dbo].[Products]
    ([ProductCategoriesId]);
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