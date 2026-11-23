# Contest Description: The Holiday Rush

## The Scenario

Meet Sam, warehouse manager at **CrunchCo Distribution**, a company that makes holiday gift baskets. Sam buys cookies, candy canes, chocolates, gingerbread, roasted nuts and peppermint bark from a group of suppliers, stores them in one regional warehouse, packs them into gift baskets, and ships the baskets in bulk to a network of retail stores.

The weeks before the holidays are Sam's busiest time of year. Stores need baskets on their shelves well before the big day, and a basket that arrives late or missing an item doesn't sell.

Sam has plenty of data: purchase orders, shipment receipts, inventory counts, lot expiration dates, and store orders. The data is there, but it isn't turning into decisions. Three problems keep coming back:

1. **Late suppliers.** Some suppliers often deliver after the promised date. When the candy canes or cookies are late, baskets can't be packed and store orders go unfilled.
2. **Expiring stock.** Cookies and chocolates approach their expiration dates while still in the warehouse, and the product can no longer be sold.
3. **Humidity.** When winter storms bring damp air, moisture can travel into the draftier parts of the warehouse. This humidity can cause soft goods like cookies to go stale. Sam usually finds out only after the damage is done.

## The Data

You'll get a snapshot of CrunchCo's data as of **Friday, December 11, 2026**, the middle of the holiday rush. It covers November 20, 2026 through January 31, 2027. Everything up to December 11 has already happened. After that you'll find open orders and the demand forecast through the end of January.

## Your Mission

Build a tool that helps Sam get more out of the data and deals with one or more of the problems above. The main question judges will ask is: **would Sam use this on a Monday morning in December?**

## Tasks

**1. Supplier Performance KPI**
Sam knows which suppliers deliver late, and how often.
- SCO features to use: Analytics Cube, Business KPI
- What to build: a KPI for on-time delivery by supplier, using purchase orders and supply shipments

**2. Next-Expiring Lot API**
The warehouse team always packs the oldest good stock first.
- SCO features to use: SCO inventory data, IRIS REST API
- What to build: an API that takes an item and returns the in-stock lot that expires next, skipping expired lots or lots expiring too soon to ship (i.e. within the next 3 weeks)

**3. Humidity Alerts**
Sam hears about damp weather before the candy canes get sticky.
- SCO features to use: Data Integration, Business KPI, Issue Management
- What to build: ingest humidity data for the warehouse location from a weather source, and create an issue when humidity is high

**4. Warehouse Dashboard**
Sam sees the state of the warehouse on one screen.
- SCO features to use: Analytics Cube, Business KPI, Dashboard
- What to build: a dashboard with the KPIs you think Sam cares about most, such as % expiring inventory, # of late sales orders, total revenue by product, and the above functionality

## Bonuses

Earn extra points by completing one or more of the following:
- Build your own dataset to use as input
- Complete the survey
- Record a short demo video (5 minutes or less) showing what Sam would do on a Monday morning
- Write an article on the InterSystems Developer Community related to Supply Chain Orchestrator or the SCO workbench

Good luck, and happy holidays!
