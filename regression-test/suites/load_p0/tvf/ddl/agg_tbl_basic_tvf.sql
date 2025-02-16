CREATE TABLE agg_tbl_basic_tvf
(
    k00 INT             NOT NULL,
    k01 DATE            NOT NULL,
    k02 BOOLEAN         REPLACE NULL,
    k03 TINYINT         SUM NULL,
    k04 SMALLINT        SUM NULL,
    k05 INT             SUM NULL,
    k06 BIGINT          SUM NULL,
    k07 LARGEINT        SUM NULL,
    k08 FLOAT           SUM NULL,
    k09 DOUBLE          SUM NULL,
    k10 DECIMAL(9,1)    SUM NULL,
    k11 DECIMALV3(9,1)  SUM NULL,
    k12 DATETIME        REPLACE NULL,
    k13 DATEV2          REPLACE NULL,
    k14 DATETIMEV2      REPLACE NULL,
    k15 CHAR(300)          REPLACE NULL,
    k16 VARCHAR(300)         REPLACE NULL,
    k17 STRING          REPLACE NULL,
    k18 JSON            REPLACE NULL,
    k19 BITMAP          BITMAP_UNION NULL,
    k20 HLL             HLL_UNION NULL,
    k21 QUANTILE_STATE  QUANTILE_UNION NULL,
    kd01 BOOLEAN         REPLACE NOT NULL DEFAULT "TRUE",
    kd02 TINYINT         SUM NOT NULL DEFAULT "1",
    kd03 SMALLINT        SUM NOT NULL DEFAULT "2",
    kd04 INT             SUM NOT NULL DEFAULT "3",
    kd05 BIGINT          SUM NOT NULL DEFAULT "4",
    kd06 LARGEINT        SUM NOT NULL DEFAULT "5",
    kd07 FLOAT           SUM NOT NULL DEFAULT "6.0",
    kd08 DOUBLE          SUM NOT NULL DEFAULT "7.0",
    kd09 DECIMAL         SUM NOT NULL DEFAULT "888888888",
    kd10 DECIMALV3       SUM NOT NULL DEFAULT "999999999",
    kd11 DATE            REPLACE NOT NULL DEFAULT "2023-08-24",
    kd12 DATETIME        REPLACE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    kd13 DATEV2          REPLACE NOT NULL DEFAULT "2023-08-24",
    kd14 DATETIMEV2      REPLACE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    kd15 CHAR(300)       REPLACE NOT NULL DEFAULT "我能吞下玻璃而不伤身体",
    kd16 VARCHAR(300)    REPLACE NOT NULL DEFAULT "我能吞下玻璃而不伤身体",
    kd17 STRING          REPLACE NOT NULL DEFAULT "我能吞下玻璃而不伤身体",
    kd18 JSON            REPLACE NULL,
    kd19 BITMAP          BITMAP_UNION NULL,
    kd20 HLL             HLL_UNION NULL,
    kd21 QUANTILE_STATE  QUANTILE_UNION NULL,

    INDEX idx_bitmap_k104 (`k01`) USING BITMAP
)
    AGGREGATE KEY(k00,k01)
PARTITION BY RANGE(k01)
(
    PARTITION p1 VALUES [('2023-08-01'), ('2023-08-11')),
    PARTITION p2 VALUES [('2023-08-11'), ('2023-08-21')),
    PARTITION p3 VALUES [('2023-08-21'), ('2023-09-01'))
)
DISTRIBUTED BY HASH(k00) BUCKETS 32
PROPERTIES (
    "replication_num" = "1"
);