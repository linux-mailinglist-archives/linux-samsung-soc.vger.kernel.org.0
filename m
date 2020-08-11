Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97551241A58
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 11 Aug 2020 13:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgHKL1A (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 11 Aug 2020 07:27:00 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45005 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbgHKL1A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 07:27:00 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200811112658euoutp02c6a441e5d04798661921d1b076c6d0b5~qMx0-Qrtj1426214262euoutp02l
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Aug 2020 11:26:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200811112658euoutp02c6a441e5d04798661921d1b076c6d0b5~qMx0-Qrtj1426214262euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597145218;
        bh=gacXBuln4oGWnyT4m4WiEPmqSVavwuGzS9Pg8D+Y3KI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=IpW6kkxj4xw6s7iyT4FxKSYoIq70d2jg3VrNQEfsaHvAHBHjtWCNjzeuGMIcEqv5u
         ZDB/COGRfVd+k2eRGxZk68nAIndfoREOhXWob1KljyDbc624wC/loAXi/gLrNyB+l1
         GPnOC1G9Hd20E+rt0ycpYA9Th4pHOkZf4z+jqVnw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200811112658eucas1p2eee3a9ebd6d951f7086d215314959a9a~qMx0op-Qs2696226962eucas1p2Z;
        Tue, 11 Aug 2020 11:26:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 95.E5.06318.280823F5; Tue, 11
        Aug 2020 12:26:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200811112657eucas1p2bf040e677830015a4a494584b5de9eba~qMx0SKU0_2695626956eucas1p2Y;
        Tue, 11 Aug 2020 11:26:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200811112657eusmtrp2ee92c98ec00123bd78465c3fb79aa36d~qMx0RhhVQ2089620896eusmtrp2X;
        Tue, 11 Aug 2020 11:26:57 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-0e-5f328082bb7b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 49.B3.06017.180823F5; Tue, 11
        Aug 2020 12:26:57 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200811112657eusmtip2b0ebaa29fe53dd5a19abb8e08a22ef0d~qMxzu6Vcy2652926529eusmtip2I;
        Tue, 11 Aug 2020 11:26:57 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org
Cc:     tomasz.figa@gmail.com, cw00.choi@samsung.com, sboyd@kernel.org,
        mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/2] clk: samsung: exynos5420: Add definition of clock ID
 for mout_sw_aclk_g3d
Date:   Tue, 11 Aug 2020 13:26:44 +0200
Message-Id: <20200811112645.24596-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWy7djP87pNDUbxBt/Os1hsnLGe1eL6l+es
        Fh977rFaXN41h81ixvl9TBZrj9xlt7h4ytXi8Jt2Vot/1zayWKza9YfRgcvj/Y1Wdo+ds+6y
        e2xa1cnm0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBmT7xxgLjjGVnHpU0kD4ynWLkZODgkB
        E4nfWyYxg9hCAisYJbpWcncxcgHZXxgl3hybwgLhfGaUmLjzFxNMx8eXrxghEssZJS5NecAG
        17L1zAWwWWwChhK9R/sYQWwRAVmJW8d+ghUxCzQzSXzub2IBSQgLJEjc+ryRDcRmEVCVuLdn
        E9gKXgFria+vvzBCrJOXWL3hADNIs4TAezaJni9zWCASLhLHjh9gh7CFJV4d3wJly0j83zmf
        CaKhmVGiZ/dtdghnAqPE/eMLoMZaS9w59wtoNQfQTZoS63fpQ4QdJfbsaWIFCUsI8EnceCsI
        EmYGMidtm84MEeaV6GgTgqhWkfi9ajo0WKQkup/8hzrNQ+JcdzcLJFBjJX6/b2WfwCg3C2HX
        AkbGVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIGJ4vS/4193MO77k3SIUYCDUYmHt8Da
        MF6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJITyxJ
        zU5NLUgtgskycXBKNTBOmqHJl1r770Ma26w7WTfCvhq0dbPZJMZ/7Njmf/qMD6viteKQN/F5
        TPVZk5xv1dsXWTSHvTz9vaZXv3z+2mr2syd3396pVybMUPpwl32PGgtzbLBpLNcP/1kPDNjE
        evOX/erk3Sh5SGPOJU23yKCib08ubE9uUJlfrRWxfn7hvNKFe0RMLymxFGckGmoxFxUnAgBd
        PzEzEAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsVy+t/xe7qNDUbxBpd26lhsnLGe1eL6l+es
        Fh977rFaXN41h81ixvl9TBZrj9xlt7h4ytXi8Jt2Vot/1zayWKza9YfRgcvj/Y1Wdo+ds+6y
        e2xa1cnm0bdlFaPH501yAaxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6
        djYpqTmZZalF+nYJehmT7xxgLjjGVnHpU0kD4ynWLkZODgkBE4mPL18xdjFycQgJLGWU2Nh+
        jb2LkQMoISUxv0UJokZY4s+1LjaImk+MErc+7WcCSbAJGEr0Hu1jBLFFBGQlbh37CVbELNDL
        JNH+fQsLSEJYIE6ibdZlsCIWAVWJe3s2gTXzClhLfH39hRFig7zE6g0HmCcw8ixgZFjFKJJa
        WpybnltspFecmFtcmpeul5yfu4kRGJ7bjv3csoOx613wIUYBDkYlHt4Ca8N4IdbEsuLK3EOM
        EhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9iNAVaPpFZSjQ5Hxg7eSXxhqaG5haWhubG5sZm
        FkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGG8c/Smb1bjaQfBaaJKq54+JE6+emNDBEfS1
        Zonr5Zy5zx1SXYOZXh+IWcEW+8BMu3+7qVz8gRedUpcls9SuLz+16uQ7W5a4be7zVopKcnCL
        3jvxYtIeHZW1+apzLZd5rjD3f2Cz4YTE7JOX9y6STjrz+vi7OIszj17LX/m3c428nHl5zc3V
        emuUWIozEg21mIuKEwGPvy1OZQIAAA==
X-CMS-MailID: 20200811112657eucas1p2bf040e677830015a4a494584b5de9eba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200811112657eucas1p2bf040e677830015a4a494584b5de9eba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200811112657eucas1p2bf040e677830015a4a494584b5de9eba
References: <CGME20200811112657eucas1p2bf040e677830015a4a494584b5de9eba@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds ID for the mout_sw_aclk_g3d (SW_CLKMUX_ACLK_G3D) clock,
mostly for internal use in the CMU driver. It will allow to avoid the
__clk_lookup() call when setting up the clock during the clock provider
initialization.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 include/dt-bindings/clock/exynos5420.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index 02d5ac4..ff917c8 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -230,6 +230,7 @@
 #define CLK_MOUT_USER_MAU_EPLL	659
 #define CLK_MOUT_SCLK_SPLL	660
 #define CLK_MOUT_MX_MSPLL_CCORE_PHY	661
+#define CLK_MOUT_SW_ACLK_G3D	662
 
 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
-- 
2.7.4

