Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D35DC3329
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Oct 2019 13:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387861AbfJALmw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Oct 2019 07:42:52 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40546 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387464AbfJALk5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=fST/AH+GOt2GHguW9Cy53gJrYgbzWWwyPXEqzuvSsEs=; b=tCb9X5iSdz0b
        Xn1KGOQTBvZ2Z6OVme0fjPxRVkv5AEjseEShBXVJMwGRdua+NxRxVeWRY0ZQQ+TAdA4vdPZdGo0gV
        A4jbN5nN+OwUmDI4e0LUa5vnuad2n0YS/DDUV8xELsEVOmGdCmQ+FqEFgbyhoOzvuddfSngWrAUfG
        NRjAE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGWQ-0004UX-V9; Tue, 01 Oct 2019 11:40:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 5D7C527429C0; Tue,  1 Oct 2019 12:40:50 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        b.zolnierkie@samsung.com, ckeepax@opensource.cirrus.com,
        devicetree@vger.kernel.org, krzk@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, lgirdwood@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        m.szyprowski@samsung.com, patches@opensource.cirrus.com,
        robh+dt@kernel.org, sbkim73@samsung.com
Subject: Applied "ASoC: dt-bindings: Document "samsung, arndale-wm1811" compatible" to the asoc tree
In-Reply-To: <20190920130218.32690-7-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114050.5D7C527429C0@ypsilon.sirena.org.uk>
Date:   Tue,  1 Oct 2019 12:40:50 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The patch

   ASoC: dt-bindings: Document "samsung, arndale-wm1811" compatible

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f4528af69fdc112247a78599c6e8f7f618aff4e6 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 20 Sep 2019 15:02:15 +0200
Subject: [PATCH] ASoC: dt-bindings: Document "samsung, arndale-wm1811"
 compatible

Add compatible string for boards with WM1811 CODEC to the list.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Link: https://lore.kernel.org/r/20190920130218.32690-7-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/arndale.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/arndale.txt b/Documentation/devicetree/bindings/sound/arndale.txt
index 0e76946385ae..17530120ccfc 100644
--- a/Documentation/devicetree/bindings/sound/arndale.txt
+++ b/Documentation/devicetree/bindings/sound/arndale.txt
@@ -1,8 +1,9 @@
 Audio Binding for Arndale boards
 
 Required properties:
-- compatible : Can be the following,
-			"samsung,arndale-rt5631"
+- compatible : Can be one of the following:
+		"samsung,arndale-rt5631",
+		"samsung,arndale-wm1811"
 
 - samsung,audio-cpu: The phandle of the Samsung I2S controller
 - samsung,audio-codec: The phandle of the audio codec
-- 
2.20.1

