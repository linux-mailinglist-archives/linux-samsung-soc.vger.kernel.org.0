Return-Path: <linux-samsung-soc+bounces-907-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7F8221A0
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  2 Jan 2024 20:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C67DEB2289D
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  2 Jan 2024 19:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71F515AE6;
	Tue,  2 Jan 2024 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="ZJazA1ZU"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDA15AE8
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jan 2024 19:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Date: Tue, 2 Jan 2024 20:00:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1704222035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mwds48W+uJe8Gd27h04WTqGUpgnvUXE+fjmem6lYAIc=;
	b=ZJazA1ZUjzhiIVOoE+8pTI06pd63mmujMW2bwuVQG7tbVARXW34rYlgc74XIvED+6dJXH3
	ViNQIr1Kdt5T2zfYPYOiCb95Q9dnaQjQ68GSQFWvwr527nfSDmo/a8Lqt+Kjsz0AuuFh3r
	OwJFKpqlwjZndyeH2fbol0Y0Upa/7c8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/panel: samsung-s6d7aa0: drop
 DRM_BUS_FLAG_DE_HIGH for lsl080al02
Message-ID: <20240102190029.GA89325@grimlerstat.localdomain>
References: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
 <20240101-tab3-display-fixes-v1-2-887ba4dbd16b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240101-tab3-display-fixes-v1-2-887ba4dbd16b@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Artur,

On Mon, Jan 01, 2024 at 10:00:16PM +0100, Artur Weber wrote:
> It turns out that I had misconfigured the device I was using the panel
> with; the bus data polarity is not high for this panel, I had to change
> the config on the display controller's side.
> 
> Fix the panel config to properly reflect its accurate settings.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

I guess it deserves a Fixes tag:
Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")

Best regards,
Henrik Grimler

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index ea5a85779382..f23d8832a1ad 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
>  	.off_func = s6d7aa0_lsl080al02_off,
>  	.drm_mode = &s6d7aa0_lsl080al02_mode,
>  	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_flags = 0,
>  
>  	.has_backlight = false,
>  	.use_passwd3 = false,
> 
> -- 
> 2.43.0
> 
> 

