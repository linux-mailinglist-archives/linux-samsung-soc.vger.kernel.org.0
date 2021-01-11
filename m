Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AADB52F126F
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Jan 2021 13:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbhAKMlS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 11 Jan 2021 07:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAKMlR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 07:41:17 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE37C061786
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:37 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d26so16218160wrb.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 04:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c7WPGyjARWHEn5FOnxpIDrNOErfvwRL0Qe863kQH62Q=;
        b=bJe6VyT9uA31Nt+VAEymHkX6HKRiEk/2CIDeJ429uFJgtSrVKYk9IbVBmeC78mIldB
         25cR5k4gBzgKOp36g1WThTy9sSNusiEblW2dmCqqlu50Zgbq3dgOJltSQGwzohxiVa/O
         wvl0LEkRa/Ivxxv3G5EqSlAha07Wzb5vWy/hPC6+wofcs8dObxCT5xkOz8CEB52727wl
         8MPkyK3IWhW5d4yrHYEp4fIYKpmG8GEklvl8tIeIsta4WIserg/BiHUqBtIHpI0MFC1g
         79xH5Q7F29NevIgHy9oQ4gJbVfKnc9E63GgEcIun61iGq+z4xy27S6+ovdn8RnPzA7jY
         Rwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c7WPGyjARWHEn5FOnxpIDrNOErfvwRL0Qe863kQH62Q=;
        b=O9n8vOmPoZiqfjNRj9GZkmB+kMW9kg/iadz95aCi1sd6gKvIl2n3SNKn3tdpMWvBMB
         uUi3lQTUuzSk5eibA2f+aH1fpZk3se3g24HcTohiAQBTISXuJW55NTOvM/P4Bf008yc6
         SLsUBYrU4Pm+P/VuE2LnHL6k2/bf6OVuMlRWuP/cgtBZPncHtSIi1KEPQgC4gx5yahiy
         EgraGF1CzkLYlx0dDAS1npcOLfUlt35qejrnjV0UD8/13sSEfnko0u2+A8bmjWb8OZ14
         N60YxPnL+Ie7IkXYgo8Y0ZzlLc0s6VHL9lfDpTJaeQTt18aAetCs/YsfRnAm03LRSjF0
         mLAQ==
X-Gm-Message-State: AOAM533VzpQCC07r7Q3g5Vb5NryqTNROxajFfsqWHKBI2pbyfb5nUXgk
        I9HfhXIaLj8MUpyAoDq8ZHq3nk1aP3ErtA==
X-Google-Smtp-Source: ABdhPJwPTEFMV3SdJzpPHcXBdPnXiwHqLmueld5y9nCnzu3ubYqPyQNh1aS1Z3fQpyzbeWaYvtlf1Q==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr16240565wrn.373.1610368836039;
        Mon, 11 Jan 2021 04:40:36 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l8sm26492362wrb.73.2021.01.11.04.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 04:40:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/3] rtc: s5m: driver improvements
Date:   Mon, 11 Jan 2021 13:40:24 +0100
Message-Id: <20210111124027.21586-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hopefully this time the kernel bot won't complain anymore...

This is a set of improvements for the rtc-s5m driver. The first patch
is new in v4: I noticed the I2C regmap is not selected by this driver's
Kconfig. Two subsequent patches were already submitted separately.

v1 -> v2:
- remove the remove() callback

v2 -> v3:
- fix an error pointed out by the build robot

v3 -> v4:
- add patch 1/3: ("rtc: s5m: select REGMAP_I2C")
- fix issues raised by the kernel bot

Bartosz Golaszewski (3):
  rtc: s5m: select REGMAP_I2C
  rtc: s5m: check the return value of s5m8767_rtc_init_reg()
  rtc: s5m: use devm_i2c_new_dummy_device()

 drivers/rtc/Kconfig   |  1 +
 drivers/rtc/rtc-s5m.c | 33 +++++++++------------------------
 2 files changed, 10 insertions(+), 24 deletions(-)

-- 
2.29.1

