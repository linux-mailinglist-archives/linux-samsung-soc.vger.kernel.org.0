Return-Path: <linux-samsung-soc+bounces-4449-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1795BD8B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 22 Aug 2024 19:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BCF21C22ADC
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 22 Aug 2024 17:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5CC1CEADD;
	Thu, 22 Aug 2024 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGHjYo9q"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D9487AE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348602; cv=none; b=Fs695gqskMUTXU5Snly4URYLxh68p2EnwQmXY3n/06fHjwp53yq/FpNeKZvQQSVXCTqn6WTPGKz9ZxWpfBmBmBGxdVqnLpzKh4sAoBlaE/1QsGQfhrxeL8furfe1dQjVXJsrusOC/GxEhlVhbKGdTKhIwGWXgmrOX73pmNl0Z30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348602; c=relaxed/simple;
	bh=E7weO86RaaW0WwgTg3wIfhJ+GMQh3XUa23negJ/H4uk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uQy5tT4SlTPIXke8GWHX2kc+1mkAhvWqvFx0DepFg0aBtG94xHN7kGmv6E+k+pUOgWEDblodtKx31IBYSPsG4xcd62azydZhiRgHiMYKdYJi9cJb4QaQ+Ox97hgsgz+13q67CJZaPGAM+ISSmVeFp3mQPwjegAnD5/DIu+OYUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGHjYo9q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724348601; x=1755884601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E7weO86RaaW0WwgTg3wIfhJ+GMQh3XUa23negJ/H4uk=;
  b=eGHjYo9qxPBxeLJfxXXF7KZc1ejTnDoOIfWIbhyO065TiOPNe0+j6oG+
   vo3osOsK2jXar+FHDRWFaNKkBT89xRKut+vpL78wTN3gG5Tedl7MDQAHy
   bI5aMXAVulWJsEbJK37zlAnQCLftrvgLXgRhRtrnobR0JJtFkKGizPr7n
   q2lHp5JyYJDHyh8IiI/FEuTXjBqMe9fwvl978BgXkSDetkc0MYc52hsGz
   GL6jFXk7giJNpQCHyTlcS+Ra+7v9l9aLEuKFFkTJuxQ/F+tIj1o9F9ZVe
   8keoyhV20kMaiWYgZdhKnApG5c2T1eeakAClLwVhxy0XOq2AmCb5TBxDo
   g==;
X-CSE-ConnectionGUID: TnQUOERST8S+QrIA0G6yLA==
X-CSE-MsgGUID: 8OgfF7SlRtmSZF8P668x3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955369"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22955369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:15 -0700
X-CSE-ConnectionGUID: s3uJDQv4SrKmVtyLgQ7tmQ==
X-CSE-MsgGUID: UbB7lboWTFCHCoz7CG6Bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="65862350"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.121])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/6] drm/exynos: hdmi: use display_info for printing display dimensions
Date: Thu, 22 Aug 2024 20:42:48 +0300
Message-Id: <8a6fd6de1853dbc337c5c26c65268604d3e91fe2.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Look up display dimensions from display_info instead of the EDID
directly. This will be helpful for the follow-up work.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1e26cd4f8347..25d508b25921 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -883,6 +883,7 @@ static const struct drm_connector_funcs hdmi_connector_funcs = {
 static int hdmi_get_modes(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
+	const struct drm_display_info *info = &connector->display_info;
 	struct edid *edid;
 	int ret;
 
@@ -893,10 +894,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto no_edid;
 
-	hdata->dvi_mode = !connector->display_info.is_hdmi;
+	hdata->dvi_mode = !info->is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
-			  edid->width_cm, edid->height_cm);
+			  info->width_mm / 10, info->height_mm / 10);
 
 	drm_connector_update_edid_property(connector, edid);
 	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
-- 
2.39.2


