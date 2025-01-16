Return-Path: <linux-samsung-soc+bounces-6374-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68000A135A9
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Jan 2025 09:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9651884F18
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Jan 2025 08:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2C41D5ADD;
	Thu, 16 Jan 2025 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LEeZiJfR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6273018E34A;
	Thu, 16 Jan 2025 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737017034; cv=none; b=kqh1HHPygKPc3Vr2yJaUjjYTWAirc79CdXUcyNosLzi0gJizOBvxUKZbOcGB/MFyGfyE/+kK73yTxhHaDUgC2+uj9x6WB6UnQtU+jznpeJK4j81YM85V6o/oK64CTBof9PIfFGur8XWXEXuGb5/hqNFujVoM8Fau3WJ+Q7DYwsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737017034; c=relaxed/simple;
	bh=YBJYqGqQ2U3g/glMhqBtVA7c9PNcNKm2bF2hwWN3X/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osWWPrdAO6iqZ6i9HBTI7MXGNRey7UcgmmScM9gB7etYLnxvqpY2Ak3b62Acf8j6+O4f3c4DfApKxVblSsC9L1GeLGExTIYMrSuBP8VmlhWOZoxVNwrCmK+QL1cVDekJakVDl1eYhrxE53RhwFx0TgS2mBun+LUYgMN6h0+ihRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LEeZiJfR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CDD7169;
	Thu, 16 Jan 2025 09:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737016967;
	bh=YBJYqGqQ2U3g/glMhqBtVA7c9PNcNKm2bF2hwWN3X/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEeZiJfRiaftp5JL3OuhSGJ31fbSk67YMrTfIULuryGPguJN8dhwOq+oPh23KD4oZ
	 oDgG9Q7qiklC025s5e31jn5W8DZrWY3XLnKdac3TlZaKlReDu0jJF+McdlL4rZbfey
	 vio2zbz4p7HYes9E+SH0Bj1kP+VRYA2cki8/bjIo=
Date: Thu, 16 Jan 2025 10:43:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250116084340.GF6754@pendragon.ideasonboard.com>
References: <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>

On Wed, Jan 15, 2025 at 02:34:26PM +0000, Daniel Stone wrote:
> On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen wrote:
> > No disagreement there, we need CREATE_DUMB2.
> >
> > My point is that we have the current UAPI, and we have userspace using
> > it, but we don't have clear rules what the ioctl does with specific
> > parameters, and we don't document how it has to be used.
> >
> > Perhaps the situation is bad, and all we can really say is that
> > CREATE_DUMB only works for use with simple RGB formats, and the behavior
> > for all other formats is platform specific. But I think even that would
> > be valuable in the UAPI docs.
> 
> Yeah, CREATE_DUMB only works for use with simple RGB formats in a
> linear layout. Not monochrome or YUV or tiled or displayed rotated or
> whatever.
> 
> If it happens to accidentally work for other uses, that's fine, but
> it's not generically reliable for anything other than simple linear
> RGB. It's intended to let you do splash screens, consoles, recovery
> password entries, and software-rendered compositors if you really
> want. Anything more than that isn't 'dumb'.

We have lots of software out there that rely on CREATE_DUMB supporting
YUV linear formats, and lots of drivers (mostly on Arm I suppose) that
implement YUV support in CREATE_DUMB. I'm fine replacing it with
something better, but I think we need a standard ioctl that can create
linear YUV buffers. I've been told many times that DRM doesn't want to
standardize buffer allocation further than what CREATE_DUMB is made for.
Can we reconsider this rule then ?

-- 
Regards,

Laurent Pinchart

