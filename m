Return-Path: <linux-samsung-soc+bounces-634-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACFF811329
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 13 Dec 2023 14:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FCE41C20F38
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 13 Dec 2023 13:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EDD2D615;
	Wed, 13 Dec 2023 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="I5JKVwPS"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4915E8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 05:43:01 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231213134259euoutp01c416b03f42358d48bf84d282d9142b2f~gZ-k3NWlV2623026230euoutp01W
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Dec 2023 13:42:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231213134259euoutp01c416b03f42358d48bf84d282d9142b2f~gZ-k3NWlV2623026230euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702474979;
	bh=rNqOysxNvghIHLfBsJRjXzN0I4umlYU/VpEb2iWIYhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5JKVwPS7NI+1MhgpjgjSIPTI4a3eGYtWevpdtFkXi3sKMEjg2cLrfB1XgKpl82GR
	 rpDemzdMXXygLjUzEmbtTbbhhzJE7J0yNdfh7MOC54v56OP5xLoqCX8QQm2505VxeP
	 nxMhP7Jg7W6sr02lHvkVP9wyy9qvXTjA3Q+XCSBw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231213134258eucas1p2467ed59f8fcf4b3e7390152b93b74452~gZ-kQ0UjJ1456214562eucas1p2a;
	Wed, 13 Dec 2023 13:42:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 02.EF.09552.2E4B9756; Wed, 13
	Dec 2023 13:42:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231213134258eucas1p23b66a7989c326176386f4a7c619cde75~gZ-j0ryfy1461914619eucas1p2-;
	Wed, 13 Dec 2023 13:42:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231213134258eusmtrp228e258757d2a5e638dcbccaa8ccbf9b0~gZ-j0AZRU0566805668eusmtrp2K;
	Wed, 13 Dec 2023 13:42:58 +0000 (GMT)
X-AuditID: cbfec7f5-83dff70000002550-09-6579b4e2dcda
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 8A.9E.09274.1E4B9756; Wed, 13
	Dec 2023 13:42:58 +0000 (GMT)
Received: from AMDC4515.eu.corp.samsungelectronics.net (unknown
	[106.120.51.28]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231213134257eusmtip1e480721ae417c29b1f686d762fe33c65~gZ-jMU9Zj1395513955eusmtip1X;
	Wed, 13 Dec 2023 13:42:57 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Mateusz Majewski <m.majewski2@samsung.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
	<rui.zhang@intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Various Exynos targets never return to no cooling
Date: Wed, 13 Dec 2023 14:42:34 +0100
Message-ID: <20231213134235.1607510-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <5ad40adf-aa79-4281-9cc3-2a1e7c10a356@arm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djP87qPtlSmGmybJ2/xfct1Jot5n2Ut
	9r7eym5xedccNovPvUcYLWac38dksbCphd1i4rHJzBZrj9xlt5j7ZSqzxZOHfWwO3B5r5q1h
	9Ng56y67x+I9L5k8Nq3qZPO4c20Pm0ffllWMHp83yQWwR3HZpKTmZJalFunbJXBl7Fpzj6lg
	lkzFi94djA2MN8S7GDk5JARMJC5PfsfYxcjFISSwglFi85/FrBDOF0aJGZtPMUM4nxklGlfs
	Z4RpafnxGMwWEljOKPHwVS5EUSuTxIVbT9lBEmwCBhIP3iwDs0UEVCWuXbjLAlLELDCXWaKz
	eREbSEJYwE7i2Kk7TF2MHBwsQEW33iqBhHmBwq/3XGSCWCYvsWfRd7ASTgFriS/XBCFKBCVO
	znzCAmIzA5U0b53NDFH+gkPi+xQpCNtFov1IEzuELSzx6vgWKFtG4v/O+VDj84GefM8CMl5C
	oELi7kEvCNNa4uMZZhCTWUBTYv0ufYhiR4mji2exQVTwSdx4Kwixn09i0rbpzBBhXomONiGI
	alWJ43smQZ0lLfGk5TbUSg+Jn4emsU5gVJyF5JNZSD6ZhbB3ASPzKkbx1NLi3PTUYuO81HK9
	4sTc4tK8dL3k/NxNjMDUdPrf8a87GFe8+qh3iJGJg/EQowQHs5II78kd5alCvCmJlVWpRfnx
	RaU5qcWHGKU5WJTEeVVT5FOFBNITS1KzU1MLUotgskwcnFINTLFSax5734+acOEN14HebTez
	P7LckFLxO2l49viq+5724gqTxM5cPZ+kvt3+/w3J3rk5P8Jdf/yuy7XfcmtSgckdH7NZp5bo
	S73vaGO62So6zf3n8uP3NllpzZ4+a+KfH/MuJpqd+n13s4jG5ON7V1k6z5t0JMvsZ2/B0f8f
	q1fm7FWQZl16mEW9zMnipbNWIM9C/eXB65Zv6E5y/s638t+VSbGX98hY/b8lqOswf/IbzQdq
	Z9dpy0yas0f8qivnw/DbU8ocfdQ2CQnYu+j/bo6MD7VSZdQ8Nm2Ojp5hp2lm4Otr6tXOqj7H
	cg6+Zu58vjWi8mccC9OzC79eN9WU6EsUTAoPu8lxS4vj48t/yZxKLMUZiYZazEXFiQDavMyv
	vAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsVy+t/xu7qPtlSmGjRsYbT4vuU6k8W8z7IW
	e19vZbe4vGsOm8Xn3iOMFjPO72OyWNjUwm4x8dhkZou1R+6yW8z9MpXZ4snDPjYHbo8189Yw
	euycdZfdY/Gel0wem1Z1snncubaHzaNvyypGj8+b5ALYo/RsivJLS1IVMvKLS2yVog0tjPQM
	LS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQydq25x1QwS6biRe8OxgbGG+JdjJwcEgIm
	Ei0/HjN2MXJxCAksZZS4Mv8aG0RCWuLwlynsELawxJ9rXWwQRc1MEqfX7GQFSbAJGEg8eLMM
	rEhEQFXi2oW7LCBFzAJLmSXeXjkGNklYwE7i2Kk7TF2MHBwsQEW33iqBhHmBwq/3XGSCWCAv
	sWfRd7ASTgFriS/XBEHCQgI8Eq827GeEKBeUODnzCQuIzQxU3rx1NvMERoFZSFKzkKQWMDKt
	YhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIymbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4T+4o
	TxXiTUmsrEotyo8vKs1JLT7EaAp09URmKdHkfGA855XEG5oZmBqamFkamFqaGSuJ83oWdCQK
	CaQnlqRmp6YWpBbB9DFxcEo1MG1LP9SlPj1liSjv3tITfpW9M0zfqsQvluv5NNFz/pTHam+t
	T0zI5Y08ELiTd4LNH80Jch2TTq5YZaAqsN9uv4HX/z7Ds/r/GHadOdAk9WaZ7y+pfcVb+2b+
	YdkvfDkz7e2hxn/7Oz2S5ghb/WV9PYFn5/KAuCAr3gOfgjkX25ornf38PbD5O/uqw2s7ciYf
	49ihO5nr0S2D5bmcjXnytptMdy0RU5vVc7PQJn+u4Msaxqwz9Zw76hLb3JdbaFpahi4Q+yqx
	p77vyW+OG7nRNQKvvKU1phcazNR/tsTrwmSv1G2iXka5X/b6au9SZdo+Zd/ig4+bE3e3doh1
	O6+yXl5Q8nv+Zo+jjXmbDv9puq7EUpyRaKjFXFScCACiFQvJLwMAAA==
X-CMS-MailID: 20231213134258eucas1p23b66a7989c326176386f4a7c619cde75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231213134258eucas1p23b66a7989c326176386f4a7c619cde75
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231213134258eucas1p23b66a7989c326176386f4a7c619cde75
References: <CGME20231213134258eucas1p23b66a7989c326176386f4a7c619cde75@eucas1p2.samsung.com>

Hi,

> I understand your requirement for the interrupts only mode, but
> maybe till the moment there is no fix upstream, you can enable
> it as well?

We (actually Marek and independently another coworker) had an idea how
to solve this while still avoiding polling all the time, and it turned
out to be quite simple to implement (PoC-quality). The idea was to run
several cycles of polling after each interrupt. This could be done like
this:

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 6482513bfe66..b4bffe405194 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -760,6 +760,12 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 {
 	struct exynos_tmu_data *data = id;
 
+	/* TODO: would need some API */
+	mutex_lock(&data->tzd->lock);
+	data->tzd->additional_poll_reps = 10;
+	data->tzd->additional_poll_jiffies = HZ / 10;
+	mutex_unlock(&data->tzd->lock);
+
 	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
 
 	mutex_lock(&data->lock);
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 625ba07cbe2f..c825d068402f 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -299,12 +299,24 @@ static void thermal_zone_device_set_polling(struct thermal_zone_device *tz,
 
 static void monitor_thermal_zone(struct thermal_zone_device *tz)
 {
+	unsigned long delay;
+
 	if (tz->mode != THERMAL_DEVICE_ENABLED)
-		thermal_zone_device_set_polling(tz, 0);
+		delay = 0;
 	else if (tz->passive)
-		thermal_zone_device_set_polling(tz, tz->passive_delay_jiffies);
+		delay = tz->passive_delay_jiffies;
 	else if (tz->polling_delay_jiffies)
-		thermal_zone_device_set_polling(tz, tz->polling_delay_jiffies);
+		delay = tz->polling_delay_jiffies;
+	else
+		delay = 0; /* TODO: ??? */
+
+	if (tz->additional_poll_reps > 0) {
+		tz->additional_poll_reps -= 1;
+		if (delay == 0 || tz->additional_poll_jiffies < delay)
+			delay = tz->additional_poll_jiffies;
+	}
+
+	thermal_zone_device_set_polling(tz, delay);
 }
 
 static void handle_non_critical_trips(struct thermal_zone_device *tz,
@@ -425,6 +437,8 @@ static void thermal_zone_device_init(struct thermal_zone_device *tz)
 	tz->temperature = THERMAL_TEMP_INVALID;
 	tz->prev_low_trip = -INT_MAX;
 	tz->prev_high_trip = INT_MAX;
+	tz->additional_poll_jiffies = 0;
+	tz->additional_poll_reps = 0;
 	list_for_each_entry(pos, &tz->thermal_instances, tz_node)
 		pos->initialized = false;
 }
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index c7190e2dfcb4..576b1f3ef25d 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -172,6 +172,8 @@ struct thermal_zone_device {
 	int passive;
 	int prev_low_trip;
 	int prev_high_trip;
+	int additional_poll_reps;
+	unsigned long additional_poll_jiffies;
 	atomic_t need_update;
 	struct thermal_zone_device_ops *ops;
 	struct thermal_zone_params *tzp;

In my tests this is enough to resolve the issue consistently on both
TM2E and XU4, both before and after my other patchset.

To be honest, this is not the most elegant solution probably and it
still doesn't really take into account the governor needs. Therefore, if

> Regarding this topic, I just wanted to tell you that I had conversation
> with Rafael & Daniel last Fri. Rafael gave me a hint to his latest work
> in his repo regarding potentially similar race with temperature value.

brings a better solution, it would be great :)

Thank you!
Mateusz

