Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF552405C6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 10 Aug 2020 14:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHJMW0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 10 Aug 2020 08:22:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45656 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgHJMW0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 08:22:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 72289293506
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: l2c: fix prefetch bits init in L2X0_AUX_CTRL using DT values
Date:   Mon, 10 Aug 2020 13:22:06 +0100
Message-Id: <76f2f3ad5e77e356e0a5b99ceee1e774a2842c25.1597061474.git.guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <267a81e550a0b5d479c82b5908e2a2caa4c9c874.1597061474.git.guillaume.tucker@collabora.com>
References: <267a81e550a0b5d479c82b5908e2a2caa4c9c874.1597061474.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The L310_PREFETCH_CTRL register bits 28 and 29 to enable data and
instruction prefetch respectively can also be accessed via the
L2X0_AUX_CTRL register.  They appear to be actually wired together in
hardware between the registers.  Changing them in the prefetch
register only will get undone when restoring the aux control register
later on.  For this reason, set these bits in both registers during
initialisation according to the devicetree property values.

Fixes: ec3bd0e68a67 ("ARM: 8391/1: l2c: add options to overwrite prefetching behavior")
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---

Notes:
    v2: tweak commit message to show this is a fix

 arch/arm/mm/cache-l2x0.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 12c26eb88afb..43d91bfd2360 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1249,20 +1249,28 @@ static void __init l2c310_of_parse(const struct device_node *np,
 
 	ret = of_property_read_u32(np, "prefetch-data", &val);
 	if (ret == 0) {
-		if (val)
+		if (val) {
 			prefetch |= L310_PREFETCH_CTRL_DATA_PREFETCH;
-		else
+			*aux_val |= L310_PREFETCH_CTRL_DATA_PREFETCH;
+		} else {
 			prefetch &= ~L310_PREFETCH_CTRL_DATA_PREFETCH;
+			*aux_val &= ~L310_PREFETCH_CTRL_DATA_PREFETCH;
+		}
+		*aux_mask &= ~L310_PREFETCH_CTRL_DATA_PREFETCH;
 	} else if (ret != -EINVAL) {
 		pr_err("L2C-310 OF prefetch-data property value is missing\n");
 	}
 
 	ret = of_property_read_u32(np, "prefetch-instr", &val);
 	if (ret == 0) {
-		if (val)
+		if (val) {
 			prefetch |= L310_PREFETCH_CTRL_INSTR_PREFETCH;
-		else
+			*aux_val |= L310_PREFETCH_CTRL_INSTR_PREFETCH;
+		} else {
 			prefetch &= ~L310_PREFETCH_CTRL_INSTR_PREFETCH;
+			*aux_val &= ~L310_PREFETCH_CTRL_INSTR_PREFETCH;
+		}
+		*aux_mask &= ~L310_PREFETCH_CTRL_INSTR_PREFETCH;
 	} else if (ret != -EINVAL) {
 		pr_err("L2C-310 OF prefetch-instr property value is missing\n");
 	}
-- 
2.20.1

