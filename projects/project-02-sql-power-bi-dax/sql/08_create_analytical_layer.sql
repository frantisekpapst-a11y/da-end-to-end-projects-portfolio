USE customer_retention_analytics;
GO

/* ============================================================
   8 CREATE ANALYTICAL LAYER

   Cíl:
   Připravit data z clean vrstvy pro business analýzu,
   KPI a následné použití v Power BI.

   Hlavní granularita:
   1 řádek = 1 zákazník × 1 měsíc
   ============================================================ */

DROP TABLE IF EXISTS analytics.ZakaznikMesic;


