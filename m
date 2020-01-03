Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57EF312FAAF
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jan 2020 17:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgACQmJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jan 2020 11:42:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:51374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgACQmI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jan 2020 11:42:08 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB45B206E6;
        Fri,  3 Jan 2020 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578069728;
        bh=I2X9wjbrKwZTwaNS0KDtFqqXOyBgCetpHii98gM1AAM=;
        h=From:To:Cc:Subject:Date:From;
        b=aqrGsRlS2a621b+qKkT9kA3CrJ0vUkHCKsZZgkB1nM1geNG3RJGDoLiCZT8zqrbrQ
         llKtHd1JgitrcTWJgiWv7twH24pj/UAICZ8jsT8KwBakzdZYtD0siuKnZ8bK6tjBya
         FYIFRkLblGT/5giZ3DnbMlXsVXDIE9JpgjLwhbpA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kyungmin Park <kyungmin.park@samsung.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT] mtd: onenand: samsung: Fix iomem access with regular memcpy
Date:   Fri,  3 Jan 2020 17:41:58 +0100
Message-Id: <20200103164158.4265-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The __iomem memory should be copied with memcpy_fromio.  This fixes
Sparse warnings like:

    drivers/mtd/nand/onenand/samsung_mtd.c:678:40: warning: incorrect type in argument 2 (different address spaces)
    drivers/mtd/nand/onenand/samsung_mtd.c:678:40:    expected void const *from
    drivers/mtd/nand/onenand/samsung_mtd.c:678:40:    got void [noderef] <asn:2> *[assigned] p
    drivers/mtd/nand/onenand/samsung_mtd.c:679:19: warning: incorrect type in assignment (different address spaces)
    drivers/mtd/nand/onenand/samsung_mtd.c:679:19:    expected void [noderef] <asn:2> *[assigned] p
    drivers/mtd/nand/onenand/samsung_mtd.c:679:19:    got unsigned char *

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Not tested

---
 drivers/mtd/nand/onenand/samsung_mtd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/onenand/samsung_mtd.c b/drivers/mtd/nand/onenand/samsung_mtd.c
index 4a78c0aed6dd..01899f8bdfa7 100644
--- a/drivers/mtd/nand/onenand/samsung_mtd.c
+++ b/drivers/mtd/nand/onenand/samsung_mtd.c
@@ -675,12 +675,12 @@ static int s5pc110_read_bufferram(struct mtd_info *mtd, int area,
 normal:
 	if (count != mtd->writesize) {
 		/* Copy the bufferram to memory to prevent unaligned access */
-		memcpy(this->page_buf, p, mtd->writesize);
-		p = this->page_buf + offset;
+		memcpy_fromio(this->page_buf, p, mtd->writesize);
+		memcpy(buffer, this->page_buf + offset, count);
+	} else {
+		memcpy_fromio(buffer, p, count);
 	}
 
-	memcpy(buffer, p, count);
-
 	return 0;
 }
 
-- 
2.17.1

