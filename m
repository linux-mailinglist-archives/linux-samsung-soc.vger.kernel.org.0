Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22028641EA7
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  4 Dec 2022 19:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiLDS3W (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 4 Dec 2022 13:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiLDS3V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 13:29:21 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8AD12ABE
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Dec 2022 10:29:20 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d6so15330273lfs.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Dec 2022 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w4/E18WmIhglr3OIlvmjkp6vFsJUZQRrJVlXhfNxPYU=;
        b=y/MaX5ZO0cE3OPHHfY0RQC5DkkHWNuMMXBloy+HhZpTftpttNLVdUyeJCINV3JvSkm
         IdODTo8/NmOen8XdIXzlS0GtqzXABocwgPL3d+RjX5sR47e8NTLJ/k1dbZHCN+qlHVxd
         OC9V/4qHfEOsdWeD9/qOd18cdKxMNCIVXF1Dz7govCRYD+x19nqUWDnfosZQJVaZYTxM
         /fyJR7+ngzf8VaQQm00Zmu8g/HCSbRQuNSxSm8BeJcJvvnkeJQXfZFPx+DNGQTANvzrE
         G6c0LoOryyUOWlWAxf7Nz3mRqCfY6YcwQWEoF75Tsvv6wR1PG8xatDFL9W22KjKaUZdy
         HYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4/E18WmIhglr3OIlvmjkp6vFsJUZQRrJVlXhfNxPYU=;
        b=Ua1oYSagh/8PoonCkvxBL2jPED4+g8cKpQSGNLVXYNuoi3soz5aQlUROm+rgdZI9F9
         ojBHr2rXYHbJ0dnxXNZuENdDQEGaKDF7EqrvBUi4gJqKu65/1cc4HSVtLzFvQM0LVsF2
         vAVEXggV5mV9nW5VjL/einODDbmPYkaEl7GwlD6C6ZuA5TqR810W4e7Lm/LNE1aEOAwG
         wuMwuAnt4NhCZge1iqKHRnCXzNF/xXyKr8nPs5lldt+OttaOfVpIlbKHXRGyUgL9+k9F
         OuVFFXVVRLhp/SGIKxFXAdTOIm+LvJqjrVEyJO9iPtivLqEU9sDC+0pn8R1IpATfMb6H
         x7yw==
X-Gm-Message-State: ANoB5pmEydQwmj3SMZnUXGeMIp3RqobJ+z/3F99mXNTkzfOc9AzonnGw
        6EqT4mZTJlFZ1HhFKTRSInLrMw==
X-Google-Smtp-Source: AA0mqf6WLTN3NKvWlgv+itL2kG62uh3gZCbmqZYxman9U/9BXTDFucax3P9rqr2IYUaQ3fk0bdiMVQ==
X-Received: by 2002:a19:3817:0:b0:4b4:e61f:16c8 with SMTP id f23-20020a193817000000b004b4e61f16c8mr21126378lfa.377.1670178558338;
        Sun, 04 Dec 2022 10:29:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date:   Sun,  4 Dec 2022 19:29:00 +0100
Message-Id: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index 8d844f4312d1..f65c9681a9f7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/media/cec/amlogic,meson-gx-ao-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO-CEC Controller
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f3c3e53f77..07cb85cac4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13553,7 +13553,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
-- 
2.34.1

