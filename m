Return-Path: <linux-samsung-soc+bounces-1691-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358638497D7
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Feb 2024 11:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05922828D8
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Feb 2024 10:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED03A1756F;
	Mon,  5 Feb 2024 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rleGl7mr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C60717543
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707129128; cv=none; b=GMpt10ffRW490e7NppNIC5ONAgDO2RfgJLXP+YckO/QREyjhugkR1tSOMyj9zYapAWxs+KJyfk5zWvTkFgkJn68FL6I9fCYYsy3o02LTxCqT8GkpX+4QmPj5liXWQQt1o/dKLrLXVBfSSWPjUqx/3ZhCASe5rzK2qWbWdBdbZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707129128; c=relaxed/simple;
	bh=TBHN3r/wtdOP5VcnZGhpuTZSEtDHTE7TqLYbYFjkc28=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=QSQ5cAxzBAjRrL1buDJ5utAXGdr8BburviX1ouslS7s7zn0oz+nc6xz+8meeOMMDvLYqertyzX9My/mc9d5x8w8RJ5cC8zlSk+NHZBdK2sksUaVOMV5CwdGhQmLl7v8NVyciDQ/tkujjZNnPcJjVMuOcfU51uB4nrC2KDUmNC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rleGl7mr; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240205103205epoutp02338e7e860b307c8e9c2cd8ed95e9ebc9~w8OUF6zAa1059210592epoutp02X
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 10:32:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240205103205epoutp02338e7e860b307c8e9c2cd8ed95e9ebc9~w8OUF6zAa1059210592epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1707129125;
	bh=sLlkI332Qx58OG8GFc9USxDt6y2FThNcf0pE5uWb+So=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rleGl7mrr9I9IBjWgiP/YW0S28F/3NnxRQIYH6seyEUS+xaBgP/1Kl953+TUfvjor
	 C3I1w3bwaZ6jQpR8c2M/bJ2LwaZQDEDUORUvHeyNjzyVq9BVHKyiCZbhiQDI6OE6Oo
	 6YXBlkuMGHrcbXurAdH4FIG3rm4x+rN/mCm2VtI8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240205103204epcas5p10c6354e456cd352a2ab6d571ccb593fe~w8OT1Fm6f1866018660epcas5p1G;
	Mon,  5 Feb 2024 10:32:04 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4TT2kC0z23z4x9Pw; Mon,  5 Feb
	2024 10:32:03 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	43.25.09634.329B0C56; Mon,  5 Feb 2024 19:32:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240205082441epcas5p1e904f4f95852de3fd8663742ed5131df~w6fE_EOc40412004120epcas5p1N;
	Mon,  5 Feb 2024 08:24:41 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240205082441epsmtrp202e1c707dbe140032d4ea37f9ac41384~w6fE9SN7D2404124041epsmtrp2j;
	Mon,  5 Feb 2024 08:24:41 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-95-65c0b9235be7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2E.39.07368.84B90C56; Mon,  5 Feb 2024 17:24:40 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240205082439epsmtip29a576ff663d6e7016e9b119016cbee0b~w6fDnk5yw2562825628epsmtip2Z;
	Mon,  5 Feb 2024 08:24:39 +0000 (GMT)
From: Tamseel Shams <m.shams@samsung.com>
To: alim.akhtar@samsung.com, krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Tamseel Shams
	<m.shams@samsung.com>
Subject: [PATCH v2] serial: samsung: honor fifosize from dts at first
Date: Mon,  5 Feb 2024 13:54:34 +0530
Message-Id: <20240205082434.36531-1-m.shams@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7bCmpq7yzgOpBn+Ps1g8mLeNzaJ58Xo2
	i3dzZSz6Xjxkttj0+BqrxeVdc9gsZpzfx2RxZnEvu8Xd1sXsDpwem1Z1snncubaHzWP/3DXs
	HpuX1Hv0bVnF6PF5k1wAW1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5i
	bqqtkotPgK5bZg7QTUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScApMCveLE3OLS
	vHS9vNQSK0MDAyNToMKE7Iyfve3MBav5K943vGdvYHzL08XIySEhYCLx5+MS9i5GLg4hgd2M
	En8eTGeDcD4xSsyZ3MQCUiUk8I1R4lmHNEzH9p3TWCCK9jJKPPzygRHCaWWSOLHtLZDDwcEm
	oClx/Dw3iCkiUCTR+JkXpIRZYAOjxIOeDUwgg4QFXCX+v3/NDmKzCKhK7Hy/mQ3E5hWwkPh3
	cB0bxDJ5idUbDjBD2IfYJU5uZ4GwXSTuLrjHCmELS7w6voUdwpaS+PxuL1RvusTch71MEHaB
	xLJd36Fq7CUOXJnDAnIbM9CZ63fpQ4RlJaaeWgdWzizAJ9H7+wlUK6/EjnkwtqLE/939UGPE
	Jd6tmAJ1gofEn6ePWCFhFSsxd88rxgmMsrMQNixgZFzFKJlaUJybnlpsWmCYl1oOj6bk/NxN
	jOCEpuW5g/Hugw96hxiZOBgPMUpwMCuJ8JrtOJAqxJuSWFmVWpQfX1Sak1p8iNEUGGQTmaVE
	k/OBKTWvJN7QxNLAxMzMzMTS2MxQSZz3devcFCGB9MSS1OzU1ILUIpg+Jg5OqQamEH6vvSo6
	V1UVn16JU/1xl3t/VN2nf5f0dqtPnsPJqXDikeCBlK+/qt+/DP4wzz720scj2w84/K9+kCTN
	9k7zcU1f14IyqbRML9WkmQJCq2JF12m5bFf8b/DrCWvdg1cXI18paf9gv7JS54rqbqWdqRP8
	b3S+PF0VUPbpNM+TBZZnn2VeXt39ujHvZcXdiRH7Flt+XSpbvPYqd9qTaVUHLp6ODhR7dDBO
	3+Woxd+LrKcqAnWeK058J3bzqtx6jn0XE7xTQsVeJE5v/fFhm3NXxLmLzqqRFebGoUw/8675
	Wgv/evcjfE9/yZNoFS3X3BOW60UdZX1mzd6m5nl2Bpv7l9pdf8XU/5q+ZfZ5dNR1hRJLcUai
	oRZzUXEiABd+3+bxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJXtdj9oFUg20fbCwezNvGZtG8eD2b
	xbu5MhZ9Lx4yW2x6fI3V4vKuOWwWM87vY7I4s7iX3eJu62J2B06PTas62TzuXNvD5rF/7hp2
	j81L6j36tqxi9Pi8SS6ALYrLJiU1J7MstUjfLoEr42dvO3PBav6K9w3v2RsY3/J0MXJySAiY
	SGzfOY2li5GLQ0hgN6PEopaj7BAJcYlpv/YzQtjCEiv/PWeHKGpmklg3bzNQBwcHm4CmxPHz
	3CA1IgJlEru677OC1DALbGGUOPf/L9ggYQFXif/vX4PZLAKqEjvfb2YDsXkFLCT+HVzHBrFA
	XmL1hgPMExh5FjAyrGKUTC0ozk3PTTYsMMxLLdcrTswtLs1L10vOz93ECA4wLY0djPfm/9M7
	xMjEwXiIUYKDWUmEd4Lw3lQh3pTEyqrUovz4otKc1OJDjNIcLErivIYzZqcICaQnlqRmp6YW
	pBbBZJk4OKUamIRn503eoPTmwcKHQS0M9xZ9lr/kVitf1S0Usjs0bMsZ5hW2kjdNZ1hN2jWP
	4ZYEA2dguOTKRQZakub7vCzjQzvfxmjmKfVkz/KZExmS5y+xVls0YKe6042IBp/AZztqJXSt
	AloXfDWJ/33suoz0JfeK/wGthw+UvbzPbtPwpdJ068WZi3feKhO5tYh/ftSlj80R3xXkdsTu
	mnMjS/tsnGVjV+CuRxai777MT9H+cDRcS271f/njW362Tc45IeraslsyiM+yzOKVQpCaxlf3
	bUfu82dxZBz0YIjdoSY23dggZUdJ0adTnr1hz/qyT2dt7Yjv/iv7M23nmY2T0iccXSHjc6Js
	V4eGxIzXFY13lFiKMxINtZiLihMB7pj+Pp8CAAA=
X-CMS-MailID: 20240205082441epcas5p1e904f4f95852de3fd8663742ed5131df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240205082441epcas5p1e904f4f95852de3fd8663742ed5131df
References: <CGME20240205082441epcas5p1e904f4f95852de3fd8663742ed5131df@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Currently for platforms which passes UART fifosize from DT gets
override by local driver structure "s3c24xx_serial_drv_data",
which is not intended. Change the code to honor fifosize from
device tree at first.

Signed-off-by: Tamseel Shams <m.shams@samsung.com>
---
Change Log:
v1 -> v2:
Acknowledged Krzysztof's comments
Initialized "ret" variable

 drivers/tty/serial/samsung_tty.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 71d17d804fda..e5dc2c32b1bd 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1952,7 +1952,7 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct s3c24xx_uart_port *ourport;
 	int index = probe_index;
-	int ret, prop = 0;
+	int ret = 1, prop = 0;
 
 	if (np) {
 		ret = of_alias_get_id(np, "serial");
@@ -1990,8 +1990,7 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 	}
 
 	if (np) {
-		of_property_read_u32(np,
-			"samsung,uart-fifosize", &ourport->port.fifosize);
+		ret = of_property_read_u32(np, "samsung,uart-fifosize", &ourport->port.fifosize);
 
 		if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
 			switch (prop) {
@@ -2009,10 +2008,13 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ourport->drv_data->fifosize[index])
-		ourport->port.fifosize = ourport->drv_data->fifosize[index];
-	else if (ourport->info->fifosize)
-		ourport->port.fifosize = ourport->info->fifosize;
+	if (ret) {
+		if (ourport->drv_data->fifosize[index])
+			ourport->port.fifosize = ourport->drv_data->fifosize[index];
+		else if (ourport->info->fifosize)
+			ourport->port.fifosize = ourport->info->fifosize;
+	}
+
 	ourport->port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_SAMSUNG_CONSOLE);
 
 	/*
-- 
2.17.1


