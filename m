Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAD3759865
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Jul 2023 16:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjGSOdY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 19 Jul 2023 10:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjGSOdX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 10:33:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35921711
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 07:33:16 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-992f15c36fcso958476966b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777195; x=1692369195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yRPgsPQ6rnjc9HE0FU9FTxzdnmLqudrZiplmwVgLF04=;
        b=GVqoIydLhu+L/ceOGLBUPwuBYp9PsY0pXhMtf07b0/+qw+fouVzb5loonGlyR5eYbG
         biYV2CJJVfxi/cX+KA89vT8ooBM3nukw6TmJziMdnct/+J44Vkt45I4kuxUYuLVnRUYG
         eB09FlB3yxPTt8iIG7zBgORr5rdj5zCtl9qfzCEE4XcB6u8E/LbspUK7OduLHdh7whRc
         mnWdDEZhFMsS8Gz9diWIRtjHDs+4Fis5pZnxZiMeBpTKIQx7PsVJe5e7GgbsxCTqnA8Q
         ltTyi+GZrosWMtNTVxeRkclF5UybJePDT0HWPKp+XGNbQiDiJImNPmtL13T53NXp8LLq
         rpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777195; x=1692369195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRPgsPQ6rnjc9HE0FU9FTxzdnmLqudrZiplmwVgLF04=;
        b=bKuaBmejy5cwsMNURKOTJXhDIIwEQ2s44waxrXE7TiS/vKo8uSOBisbu72W1tZvLvt
         WG54DRBV+Cg/UfbjxqJetq+vGNQUxpC1e7HPO5HZONUkNFmkCavZQkLG8PKX7aaCSHub
         l3mxMNRQxRBYLJ1A43PtNcgmBMgR2iLtfFRlOvEhS3yvcPKQaYYIu1sIPZYxCs9wrPRc
         w9QAjsG/gsz+ayzXCY7aTq7Z4Hk5oHX4LcthzWLZx706oQ1EORRzkQyKI9vgpV6XEPBF
         HXKJ3whQOKJYMPMQUAuJbtoGtLJPlAyPljs+rzpDNNtGHEo+KJ2uo3wy4qqJZU8qnZrK
         XQGQ==
X-Gm-Message-State: ABy/qLZ0EHjZFtmktg1OmfYE7ssGT7jQe9CHcGlWY6nhmGX7Nh1NtBor
        tSqyIK+nO1cyv9hvPr5BheMOvQ==
X-Google-Smtp-Source: APBJJlEwRkFb27k8FoPkGWYStYAeFHuQmt4W3pAQlXmZnBWOWpKR8QGlzVztPlnEmWXodj3CPpBlJA==
X-Received: by 2002:a17:906:cc5b:b0:991:f427:2fd8 with SMTP id mm27-20020a170906cc5b00b00991f4272fd8mr2382943ejb.74.1689777195309;
        Wed, 19 Jul 2023 07:33:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, arm@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/3] MAINTAINERS: soc: reference maintainer profile
Date:   Wed, 19 Jul 2023 16:33:07 +0200
Message-Id: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mention the SoC maintainer profile in P: entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

---

Changes in v2:
1. Add Rb tag.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a83f19d2b46d..ba5e7344f30e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1570,6 +1570,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc.rst
-- 
2.34.1

