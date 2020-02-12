Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFC715A882
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Feb 2020 13:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgBLMCr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 12 Feb 2020 07:02:47 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45779 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgBLMCr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 07:02:47 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so1127357pfg.12;
        Wed, 12 Feb 2020 04:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xw8F0MAhPNgiUaS09840sx7LbckyTA6PLEiym6zDUiM=;
        b=aj694rFuab2x87PC7uIkm0Vi5hbAPJu/MyS3gdm3S1KSApSLXBigQNZ3dfjSWCIdqm
         +FRDNLKadS/8jrPUdb8pO8bIX+Kfd/AoZFehzmw+ACRZBYQFku4f0XU5u6L3OA8Jv+HT
         quNBAhLqeshXbSNY4uRf/Qn8Wlvp/7TQR8vg5MzU5MKvMkuzidATCLAaEcdZ/RZAQYLZ
         dHYraqkUFl+7PZosNbZgnTdwjxH4lStisowuZd3zylIjpquuZKS0PgvMiXUv/oaG+RVa
         2m/rYWDqcNDYglWXahBYV/T2UuNwukw6TSz4DwS5JThPQ9v2aiDpuLlYGgJOhr7B46A2
         fosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xw8F0MAhPNgiUaS09840sx7LbckyTA6PLEiym6zDUiM=;
        b=RXYdG7cPdjRljxRxhksz4U82aMS0qUxNswMn96texr78dh20ccQ1xEPfulsK5X9MLC
         P9l6z42dZVP1nBpr/BF6p9rpvGfqGDefG36TDQ1J/ID7pUtphAM7kVCWK8Q6cQzSfzSt
         FQaD+h8MPlsVSmvhFuD4/URmV7jivpi6GL65KQFAJGUOculsSAgfftn4TVEYJrsSa9ou
         ItRZoEhMjUjFjxzE2kCvmeJViKHKSYJ1pGdRoUYuTZF3VJl+zjSe2AnaBdsKwLtJg01p
         dq9xrqUALg7h8cHxglOejgswBczuYo5SPwagnbNrtRe9tof+Xc3Z+0f2ldURfEeaX1ad
         k2gA==
X-Gm-Message-State: APjAAAWlX7MOHQ9kmEeTYMR1vRLr0G9wtk2fB5RcsPG5b2jXqSAvFQIY
        wqio73risSvYC4+87CYytWE=
X-Google-Smtp-Source: APXvYqxU7IDMf52DUiq2vDOOz2xZ03U/hrRAqWXLxJtcTfAc8f8ik69Va9s1lkd1Y4mKxnI6Sd/Xbg==
X-Received: by 2002:a65:5242:: with SMTP id q2mr11764466pgp.74.1581508966796;
        Wed, 12 Feb 2020 04:02:46 -0800 (PST)
Received: from localhost.localdomain ([45.114.62.33])
        by smtp.gmail.com with ESMTPSA id b24sm682448pfo.84.2020.02.12.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 04:02:46 -0800 (PST)
From:   Anand Moon <linux.amoon@gmail.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv1 0/2] Add FSYS2 power domain for MMC driver
Date:   Wed, 12 Feb 2020 12:02:35 +0000
Message-Id: <20200212120237.1332-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patches add the power domain for MMC driver,
but somehow the suspend/resume feature is broken
so any input on how to fix this.

Also on similar lines I tried to add power domain
FSYS for usb3 and usb2 nodes but this time
it failed to load the kernel, so how can I reslove
this issue.

-Anand

Anand Moon (2):
  ARM: dts: exynos: Add FSYS2 power domain to Exynos542x
  clk: samsung: exynos542x: Move FSYS2 subsystem clocks to its sub-CMU

 arch/arm/boot/dts/exynos5420.dtsi    | 10 ++++++++++
 drivers/clk/samsung/clk-exynos5420.c | 24 +++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.25.0

