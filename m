Return-Path: <linux-samsung-soc+bounces-755-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C21819D86
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Dec 2023 12:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B332876DF
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Dec 2023 11:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF75210F6;
	Wed, 20 Dec 2023 11:02:58 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B35D210EA;
	Wed, 20 Dec 2023 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919B71FB;
	Wed, 20 Dec 2023 03:03:40 -0800 (PST)
Received: from e129166.arm.com (unknown [10.57.82.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC9DC3F5A1;
	Wed, 20 Dec 2023 03:02:52 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: lukasz.luba@arm.com,
	dietmar.eggemann@arm.com,
	linux-arm-kernel@lists.infradead.org,
	sboyd@kernel.org,
	nm@ti.com,
	linux-samsung-soc@vger.kernel.org,
	daniel.lezcano@linaro.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	m.szyprowski@samsung.com,
	xuewen.yan94@gmail.com,
	mhiramat@kernel.org,
	qyousef@layalina.io,
	wvw@google.com
Subject: [RFC PATCH 0/2] Introduce runtime modifiable Energy Model
Date: Wed, 20 Dec 2023 11:03:37 +0000
Message-Id: <20231220110339.1065505-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a follow-up patch aiming to show the users of the proposed
runtime modifiable Energy Model framework. The patches and discussion is
available here [1]. I didn't wanted to add more complexity in that
already big EM patch set and planned to add more users later.
This patch set is one of the first user. I have talked about the chip
binning in a few conferences and the need to update the EM after boot.
This Exynos is one of the platforms which adjust voltage after the EM
is registered. This is perfectly fine and alloed in the kernel, even
from a module so very late. The EM framework should just allow to
modify the power values after that.

This patch set will have to wait for merging of the dependet main EM
change. 

Regards,
Lukasz Luba

[1] https://lore.kernel.org/lkml/20231129110853.94344-1-lukasz.luba@arm.com/

Lukasz Luba (2):
  OPP: Add API to update EM after adjustment of voltage for OPPs
  soc: samsung: exynos-asv: Update Energy Model after adjusting voltage

 drivers/opp/of.c                 | 69 ++++++++++++++++++++++++++++++++
 drivers/soc/samsung/exynos-asv.c | 10 ++++-
 include/linux/pm_opp.h           |  6 +++
 3 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.25.1


