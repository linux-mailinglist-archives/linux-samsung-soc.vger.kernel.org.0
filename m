Return-Path: <linux-samsung-soc+bounces-6420-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCCA17C12
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Jan 2025 11:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE173A35A2
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Jan 2025 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010A51F0E2D;
	Tue, 21 Jan 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LogInKre"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1A1EEA3C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456281; cv=none; b=edVbYkJ10LYV8aulUGmQln5wNdz+GADsHBOKXq+QjI3PrVLwDhl1Z77Yj0RJRZdogMTD74bt5Q11I0rT4x8iDMvUlwPbPQJS907ElMVmzY6d1J3IwPFlZMfI0P6DIWi7t7jR9xftzTIFA6okuDwtcfBUnho3YKwbV9A7VY0IhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456281; c=relaxed/simple;
	bh=iwqLBI6x6ziAFcEg9T4VUa24HE5Sj5tajYDP14hy/pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvHgWr6aCdQLRQjmUk3ARYLpgcbSC96JhulBPg2p4opO6y0Mx5z1dMBEv5WqN0mh1aPcO5sXg2cGtpqdOshvq+VXPl+eZMhB+xjyJ7TNb8dVnMuGMZHj3jX8HnwyVf3xLAnQ+Pt3JvGKAT5hlrNAVgqxHg1MX6MeRiPwkKBr/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LogInKre; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so9019564276.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737456279; x=1738061079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM4RiAz8x0xBzhbf4AlSqIUYbrQ3SaJ7YEvWtIB73WA=;
        b=LogInKre9ZMj39sWKmwHAk0rt/hsr3v7HfIgT4cYUGBTLclgfqfhBY1nsKXp+0iL0Z
         k3D8UCwqC4DdkqpoEF+xVdDHUBT5WE04nyWBhydylFlcg/6zjwsdMIWv1g8NH2bh/rKF
         7o1AqWhhZaivVHSZ+tgHDHp+gVS3OCkdCorKwAOQIrFOufJOI/w4wW4/rLI7cC37SACp
         LoW/iN2Q6aoWT2B01jqzE7SJRe552Ee0ajRZ7dfCNljOX72CXB9AXQbVvEtvgYEId10g
         u1DZFof78wmaPT3Uav3gCrulbGmEYSu6SUYOVpcOIAZ6uZYE5Sdl+YMHRaGqRu/cRMof
         lV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456279; x=1738061079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM4RiAz8x0xBzhbf4AlSqIUYbrQ3SaJ7YEvWtIB73WA=;
        b=XGSHHhuko0QxAsU3aEusiZ9aSRMLyD4h7Lv6SqrVuTvPmlpVnNfIb8QW9mGTOzKEFf
         luTkS1D7aizmCuaXRI48I4hPs9tFDfp49oQR7/rZOWWwAcK7k8R79jYIMnTHEmItcK62
         gxX9zxWDkxAQF45j5BL2IAiDmOPNQgTaProsWS2oofOQf19XPFNjZYucqtJKlRgWZ10K
         LSBMh+wJxyroJCiSln0hb8KROx2Td2dRZGczBpU8yzbZq3Ef83KYlG21c1nTyMs5uLIW
         d0vWJq1KCExdqixWom1ocelA4y31Cj2FksT8wKdcWJB8OqwfW1h03BBamuW4cAd4XPJL
         ISyA==
X-Forwarded-Encrypted: i=1; AJvYcCUldf+YIyVMBCOfH9JFJfSXSOx3mEUPzEGECZzavDsm1tjrguuHuf/lw0DBNKIzLIhoWTJeu2KZpxJkD0VduyaXgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/+ovnPrQtjqVARhIWcU/0gyK8feRV9GhKBM0E3bBGn1i/1fmj
	6ZjKL3JTNVHTWLhhBTY91EFNeJ/cfBgjnsCYHQhrUx3iO8dlE1IHBCl7eQ+Yf+0vVoOAZkUWVDU
	HY5akPfCNFbzY/o+u1NnkyuPLRqOJi25KGNxA+Q==
X-Gm-Gg: ASbGncsnSxRxd+e7cvdEjTSLMctY7H4M0Hadha2+0SwNtxQNnvqZ86sGUeUUikET9S8
	tlv7qdAN9FR0svvFLUjchmEpNkWZIexsbrbea9Av7ymw17LhJO1FeQLMfEO3qr4N0wQ==
X-Google-Smtp-Source: AGHT+IHO0V0jurSGd/L1Ymx0QNx/m/A6wTdCul+m+iz6FYx+lOCJoAuF4E4jOdjfH48/SXNUBM+6kJMlTjWcDWiw9yM=
X-Received: by 2002:a05:690c:3701:b0:6f6:d4bf:d01a with SMTP id
 00721157ae682-6f6eb940fb8mr129606697b3.34.1737456278815; Tue, 21 Jan 2025
 02:44:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org> <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
In-Reply-To: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 12:44:27 +0200
X-Gm-Features: AbW1kvabZ-in97OiEwfu0vjcyzelZUBMNUaWG-jd-XhigpbETlYrZDr4y_chW2I
Message-ID: <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Dmitry,
>
> On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > While working on the generic mode_valid() implementation for the HDMI
> > > Connector framework I noticed that unlike other DRM objects
> > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > while obviously mode_valid() isn't expected to modify the argument.
> > >
> > > Mass-change the DRM framework code to pass const argument to that
> > > callback.
> > >
> > > [...]
> >
> > Applied to drm-misc-next, thanks!
> >
> > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_displa=
y_mode
> >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
> >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode=
_idx()
> >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_displa=
y_mode
> >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > [5/5] drm/connector: make mode_valid take a const struct drm_display_mo=
de
> >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
>
> I cannot find these in drm-misc or drm-next, but they are in drm-tip?

These are in drm-misc/drm-misc-next, the commit IDs are a part of the
Git history.

> The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> branch 'drm-misc/drm-misc-next' into drm-tip").
>
> What am I missing?
> Thanks!

It might be some kind of misinteraction between drm-misc-next vs
drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.

>
> P.S. Sima: noticed while resolving a merge conflict using drm-tip. Thx!


--=20
With best wishes
Dmitry

