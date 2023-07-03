Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE68746510
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Jul 2023 23:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjGCVrl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Jul 2023 17:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjGCVrk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jul 2023 17:47:40 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2428610CB;
        Mon,  3 Jul 2023 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688420844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4oLQCPLjN8l2YTID6H0ryGT8g2PPvTf/0QShunooQsw=;
        b=zuFEIjlOtnxkYeTqQUiaRC/fqJuLVJwfE+bRXOBfTf9OUPSyrvsjIHB9wVh7TrYrgdu3j4
        JlsBd7qukg5cl5unEybkMpTXIK9th0e6VmcSeDbQFfmtS6Nz/Z17b5ACWufyCLDl6k/1se
        ie6uqAoSeR+sgWPIYTKK2w9cdyquDEU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] drm/panel: ld9040: Use better magic values
Date:   Mon,  3 Jul 2023 23:47:13 +0200
Message-Id: <20230703214715.623447-2-paul@crapouillou.net>
In-Reply-To: <20230703214715.623447-1-paul@crapouillou.net>
References: <20230703214715.623447-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I have no idea what the prior magic values mean, and I have no idea
what my replacement (extracted from [1]) magic values mean.

What I do know, is that these new values result in a much better
picture, where the blacks are really black (as you would expect on an
AMOLED display) instead of grey-ish.

[1] https://github.com/dorimanx/Dorimanx-SG2-I9100-Kernel/blob/master-jelly-bean/arch/arm/mach-exynos/u1-panel.h

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 01eb211f32f7..7fd9444b42c5 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -180,17 +180,18 @@ static void ld9040_init(struct ld9040 *ctx)
 {
 	ld9040_dcs_write_seq_static(ctx, MCS_USER_SETTING, 0x5a, 0x5a);
 	ld9040_dcs_write_seq_static(ctx, MCS_PANEL_CONDITION,
-		0x05, 0x65, 0x96, 0x71, 0x7d, 0x19, 0x3b, 0x0d,
-		0x19, 0x7e, 0x0d, 0xe2, 0x00, 0x00, 0x7e, 0x7d,
-		0x07, 0x07, 0x20, 0x20, 0x20, 0x02, 0x02);
+		0x05, 0x5e, 0x96, 0x6b, 0x7d, 0x0d, 0x3f, 0x00,
+		0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x07, 0x05, 0x1f, 0x1f, 0x1f, 0x00, 0x00);
 	ld9040_dcs_write_seq_static(ctx, MCS_DISPCTL,
-		0x02, 0x08, 0x08, 0x10, 0x10);
+		0x02, 0x06, 0x0a, 0x10, 0x10);
 	ld9040_dcs_write_seq_static(ctx, MCS_MANPWR, 0x04);
 	ld9040_dcs_write_seq_static(ctx, MCS_POWER_CTRL,
 		0x0a, 0x87, 0x25, 0x6a, 0x44, 0x02, 0x88);
-	ld9040_dcs_write_seq_static(ctx, MCS_ELVSS_ON, 0x0d, 0x00, 0x16);
+	ld9040_dcs_write_seq_static(ctx, MCS_ELVSS_ON, 0x0f, 0x00, 0x16);
 	ld9040_dcs_write_seq_static(ctx, MCS_GTCON, 0x09, 0x00, 0x00);
 	ld9040_brightness_set(ctx);
+
 	ld9040_dcs_write_seq_static(ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	ld9040_dcs_write_seq_static(ctx, MIPI_DCS_SET_DISPLAY_ON);
 }
-- 
2.40.1

