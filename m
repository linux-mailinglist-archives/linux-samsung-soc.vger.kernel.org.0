Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8F577471A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  8 Aug 2023 21:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbjHHTJj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 8 Aug 2023 15:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbjHHTJB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 15:09:01 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9647D54AF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:30:56 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so7603030a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512234; x=1692117034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7mP4H675HuYuOMx1xcJqbSqbpr2VMcAkjxgMIL4uqE=;
        b=T9RSfeb9Ylu4uls4p6Pd+t3MvdlTmCzGdVXPbXux94/EZ8iQUeBh0OHKEDYn5aFIxv
         cNf9wU6KTyXJjUOmQUUt9Wq5MEP/gjZTG0XN243hRany4DOyuIetbGmZk4XQZm1q6BbO
         6eriACPd73dplBQ36UhWBpF7G/+356UO0iFHjEmgXZ5t2Pvjyo9oMZPutOgflJkwSiTW
         qfjnUZqxe/roYAbZZmdiTN9740UoxdZrey2I1WhJHE+bsIIcHmRf8biowvi56D+OauTl
         s9MaGbRUBnHYNajg9LrEhxPYoSrEJ3iSwSgVAu7jR8VAhD7N7e2dWUV4A3ONZf+nWqwo
         O8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512234; x=1692117034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7mP4H675HuYuOMx1xcJqbSqbpr2VMcAkjxgMIL4uqE=;
        b=T4OpNJ1W9ihRARDrttdsNLrkqs8xbtrxb8DKVyZFir8r0rr8wnKJO7b4zjuTOBOgXY
         jGxYKrCZRWtWWxJqMcfoExllqUOIAOtsk02kpPgZfQKVeuR+ARLV+aWPvNdRXFzEMuUM
         Ug+1C26AMhBclS3PQZF/FYmOXSzhjc7NR2ASpHarA07Cg9sFMg5alexZUtnOi1yaakDw
         ec66i4QcRxjhXiopqzo2Coi2Lk8SnWmy/n1pVW3IDPAuUJ0jMTv2uHre3WXLrQHvERpm
         xnagMNDck58DFczgaiwKsYUwzvbZvErwB/jvOb1oX/nwJB0u0u+V17Rh3ZwCR3mU+/Vo
         aFGw==
X-Gm-Message-State: AOJu0Yyr9X/xEIFNRpkBRijJn5nt+PL6VrL0PCW+pdO/9efAogvVnJfc
        D/B76Z5K8SkMvdjOMkKC29wLJnKaPLeyNRG+iFU=
X-Google-Smtp-Source: AGHT+IFqBorBvecJ4DsCotdQRzKRs6+3bXazzEJyN+B+FiwvRNYD3ybpCup1aLJlqFYk3XPz1XFCeA==
X-Received: by 2002:a2e:9e0c:0:b0:2b5:8bb9:4dd6 with SMTP id e12-20020a2e9e0c000000b002b58bb94dd6mr8345831ljk.12.1691502404392;
        Tue, 08 Aug 2023 06:46:44 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:32 +0200
Subject: [PATCH 05/11] regulator: rc5t583: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-5-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RC5T583 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rc5t583-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/rc5t583-regulator.c b/drivers/regulator/rc5t583-regulator.c
index a5afca73715d..a25a141e86c4 100644
--- a/drivers/regulator/rc5t583-regulator.c
+++ b/drivers/regulator/rc5t583-regulator.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
-#include <linux/gpio.h>
 #include <linux/mfd/rc5t583.h>
 
 struct rc5t583_regulator_info {

-- 
2.34.1

