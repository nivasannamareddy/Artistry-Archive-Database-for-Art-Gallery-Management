# Artistry Archive – Art Gallery Database Management System

**University of Texas at Dallas – Jindal School of Management (JSOM)**  
Project Lead: Nivas Annamreddy  
Group: 11  

---

## Project Overview
The **Artistry Archive** is a relational **Art Gallery Database Management System** developed to centralize and automate the management of art collections, exhibitions, and sales operations for modern art institutions.  
The system is designed to streamline the organization of **artworks, artists, exhibitions, sales, customers, and gallery events** while maintaining data integrity, scalability, and security.

This project demonstrates database design principles, SQL programming, and query optimization, including the use of **views, stored procedures, triggers, and functions** to manage and analyze gallery data effectively:contentReference[oaicite:1]{index=1}.

---

## Project Objectives
- Develop a robust and normalized relational database for art gallery operations.  
- Improve accuracy and accessibility of art-related information.  
- Enable effective tracking of exhibitions, sales, and restoration activities.  
- Support analytical insights for decision-making through complex SQL queries.  
- Ensure security and data consistency through constraints, triggers, and access control.  
- Provide scalability and future integration with UI and analytics tools.

---

## Scope of the System
| Feature Area | Description |
|:--|:--|
| **Art Collection Management** | Store and manage detailed records of artworks including title, artist, medium, and dimensions. |
| **Artist Profiles** | Maintain complete information on artists such as biography, nationality, and exhibition history. |
| **Exhibition Tracking** | Manage schedules, artwork displays, and event participation. |
| **Sales Management** | Record sales transactions, track customer details, and monitor revenue trends. |
| **Inventory and Restoration** | Track inventory condition, storage, and restoration records. |
| **Sponsorship and Events** | Manage sponsor contributions and art-related events. |
| **Security and Access Control** | Role-based user management and data encryption. |

---

## System Design Highlights
- **Normalization:** All tables follow 3NF to eliminate redundancy.  
- **Relational Integrity:** Primary and foreign keys ensure referential consistency.  
- **Scalability:** Structure supports integration with web and mobile layers.  
- **Security:** Triggers, constraints, and controlled access for sensitive data.  
- **Extensibility:** Designed for future cloud deployment and predictive analytics.

---

## Database Schema Overview
The system includes **17 interrelated tables**, covering entities such as:

- **Artists**
- **Artworks**
- **ArtCategory**
- **Exhibitions**
- **Customers**
- **Employees**
- **Sales**
- **RestorationRecords**
- **SponsorRecords**
- **OwningOrganization**
- **Galleries**
- **Events**

These tables capture the complete life cycle of artwork management within a gallery environment:contentReference[oaicite:2]{index=2}.

---

## SQL Components Implemented
### 1. Views
- **ActiveExhibitions:** Lists ongoing exhibitions and their associated artworks.  
- **ArtistProfiles:** Aggregates artist information with artwork count and bio details.

### 2. Complex Queries
- Artist performance and sales reports.  
- High-value artwork and medium-based comparisons.  
- Collaboration trends among artists.  
- Revenue optimization and nationality-based analysis.

### 3. Stored Procedures
- Retrieve artwork details by artist and price range.  
- Filter restoration records by year, type, and restorer.  
- Fetch exhibition details for specific venues and artwork counts.

### 4. Stored Functions
- GetArtistFullName() – Returns full artist name.  
- GetTotalArtworks() – Counts artworks created by an artist.  
- GetArtistNationality() – Retrieves nationality based on ID.  
- IsArtworkAvailable() – Checks if artwork is available for exhibition.  
- GetArtistEmail() – Returns artist’s contact email.

### 5. Triggers
- Validate artwork data before insert or update.  
- Log changes and maintain audit records.  
- Archive deleted artworks automatically.

---

## Project Milestones
| Milestone | Deliverable | Date |
|:--|:--|:--|
| Project Charter and Objective | Defined scope and goals | 09/18/2024 |
| Schema Design | Table and relationship modeling | 09/23/2024 |
| Table Creation and Sample Data | 15 tables, 10 queries | 10/10/2024 |
| SQL Programming | Procedures, Functions, Triggers | 10/17/2024 |
| Database Finalization | Complex queries and testing | 10/24/2024 |
| Presentation Preparation | Group assignments and review | 11/07/2024 |
| Final Submission | Report and demonstration | 12/05/2024 |

---

## Tools and Technologies
| Category | Tools Used |
|:--|:--|
| **Database** | MySQL / SQL Workbench |
| **Design and Modeling** | Lucidchart, Draw.io |
| **Documentation** | Microsoft Word, Google Docs |
| **Version Control** | Git and GitHub |
| **Presentation** | PowerPoint, YouTube Video |
