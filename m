Return-Path: <linux-samsung-soc+bounces-2196-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03714870CD6
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Mar 2024 22:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360B01C23E35
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Mar 2024 21:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECC879DDE;
	Mon,  4 Mar 2024 21:29:08 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE134C62A
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Mar 2024 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709587748; cv=none; b=jihF9NuDEEtNUIikJ0QQzgN8E9dbO0hQ8HM59MJJTCLP1RfHKAiO3VJ/r0i6atc6K6tNtMSB5rjz9RjIlh40HEzU6OKajXFoMMwsUB8n/AchKgVZnR+DRJXBcG1Un/WkJwCi/8j1ndY/qWO6tE/bFpbe3BkK6Ah7FtH0Pp4QA+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709587748; c=relaxed/simple;
	bh=I8FrXbA0yYPCBU7whuLuGnZASBBwSsmETYGw/S5pQmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J6qQqXcZmn+fQ4LwsvyxIKxKzkIRTR73eoBuDlCAn8PW6Dr/Ax4y4vjaKQBz6o1b43ADykvf2zPN6Grv6/3JdwGZm7dToXlNraquTEFnab5HnHNKBokE3UXyfzZ9mclxhByrnzt0TMV8Syoutt2Pyo8qkDMOtH5Ay8/LAHLwFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrm-0002ha-4c; Mon, 04 Mar 2024 22:28:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrj-004QhJ-Rw; Mon, 04 Mar 2024 22:28:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrj-00H4uB-2S;
	Mon, 04 Mar 2024 22:28:55 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/5] PM / devfreq: Convert to platform remove callback returning void
Date: Mon,  4 Mar 2024 22:28:38 +0100
Message-ID: <cover.1709587301.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=I8FrXbA0yYPCBU7whuLuGnZASBBwSsmETYGw/S5pQmY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5j0HnQ9HbZZ2kPQg87lTw1l0aHXNyWwhnhsnF Ze2WEkKiWiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeY9BwAKCRCPgPtYfRL+ TpwtB/9gDVqajzBWr6Yq2hzHvcBIPncZICpIow1WLn3frJrifgVnMYr8KCoL2Syo+Wp1V/UkKLo Ys1yqZP7AnZh6IKp78Npuk7YMFgidKtO3Vhx+zzIirOxSTs1tGnhmaYy2SFs6NGUjQsIZGg8FSm b/PPvk0shfxxxVbfryhvsZLHJ+VXY7kyZgZpsv4YlbPRJRuadTF9GyZskOy542wl5jvE0F9UI/X XeoQIioJNbpQWlflc3xqke4/O83jhaQs8b0ofFGKNZ5Ei6btSXes5WNOHP3tM1EOU8rkPm794OA 6xJ96LXSxqWLgYXcg6lHBlIttaq6IRp40Rau9hrup3/gPFLE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org

Hello,

this series converts all drivers below drivers/devfreq to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provide a
remove callback that returns no value") for an extended explanation and the
eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together by the devfreq maintainers.

Best regards
Uwe

Uwe Kleine-König (5):
  PM / devfreq: exynos-nocp: Convert to platform remove callback returning void
  PM / devfreq: exynos-ppmu: Convert to platform remove callback returning void
  PM / devfreq: mtk-cci: Convert to platform remove callback returning void
  PM / devfreq: rk3399_dmc: Convert to platform remove callback returning void
  PM / devfreq: sun8i-a33-mbus: Convert to platform remove callback returning void

 drivers/devfreq/event/exynos-nocp.c | 6 ++----
 drivers/devfreq/event/exynos-ppmu.c | 6 ++----
 drivers/devfreq/mtk-cci-devfreq.c   | 6 ++----
 drivers/devfreq/rk3399_dmc.c        | 6 ++----
 drivers/devfreq/sun8i-a33-mbus.c    | 6 ++----
 5 files changed, 10 insertions(+), 20 deletions(-)

base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
-- 
2.43.0


