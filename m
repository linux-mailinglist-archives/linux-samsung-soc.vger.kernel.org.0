Return-Path: <linux-samsung-soc+bounces-4736-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25D9866FA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Sep 2024 21:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CECCB232D4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Sep 2024 19:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8347D1428F3;
	Wed, 25 Sep 2024 19:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SMz/6Jmf"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ABD140E38;
	Wed, 25 Sep 2024 19:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727293023; cv=none; b=stWkQq98vbrzCOpJqCtjzlMcaMq24/6rrrZzymPxFxjIF52QWj9/r82vlk7fBRJmsgDO4FjNurwTXcq4A3nSzePb/nuDZilr4rS/QesxbzOK7DN+h9GaeMvKV7ijpftfglmdDiehaFeWf+xXlMVlB9Je2I4N5adV/mDhUtiYXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727293023; c=relaxed/simple;
	bh=jNzpilK7Bz1MMyp6+o0M9jtoagRvfncD3J5qPsARZag=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=oIixYAW5ztX/KzTQ2Db8U6nDxZT9DWzS27e1MPBkfdux3nP3QtV6OCyc+piq11p/J8d6goLsKKGENSAVDBNEeym4rGeJwfHE6kbnPfBDS3kTUKFXaqDlsnyA6HHhG/vDvO4u7/E9og4/zcHvUIBv7VgrF/j8O9cze1uKeolMdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SMz/6Jmf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7B06D23CAD;
	Wed, 25 Sep 2024 21:36:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5kuwsCfjDHF; Wed, 25 Sep 2024 21:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727293018; bh=jNzpilK7Bz1MMyp6+o0M9jtoagRvfncD3J5qPsARZag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SMz/6Jmfw9gQX5uIGhphwfp3u4kcXpKBhhW3jAtLVZWI40+EW2AwSw0wl5rEAnvbp
	 oz8bmAdL5pjSeYwyEWqbRslIBz8VEwKYz1lJwrbPx6E8tm68ap4M8DNbAyJpZMv7hA
	 y1klG79b/1YN9DZ85tAeAM8jOyJZf8MOgxXWPnBdGvsy+mcCcZuS+l4GxVLYXmiVY3
	 28AFZLlUL3MBsusG3vgImJvuUmmnUqLgRJEESil72uScxH/2QlkSCkhAuTNQroKTWy
	 DCq/cnyvhZl5E/S4bjKogoONGsTbhWt+7P3SAn+W9/RZRWbfilvGhhaVK34JTqd0RB
	 PLO48DZ+Mz66w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 19:36:58 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de, kauschluss@disroot.org
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
In-Reply-To: <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
 <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
 <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
Message-ID: <8e0672ad3fd72f69d2bdb5687e778c86@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2024-09-25 19:25, Krzysztof Kozlowski wrote:
> On 25/09/2024 20:42, Kaustabh Chakraborty wrote:
>> On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
>>> On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>>>> Add the compatible string of Exynos7870 to the existing list.
>>>>
>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>
>>> ... and the DTS is <please provide lore ink in changelog>?
>> 
>> Didn't quite understand. The patch adds the compatible string
>> for Exynos7870 DECON in documentation. There's no DTS involved
>> in here, right?
> 
> Provide lore link to the DTS submission.

There aren't any DTS submissions *yet* which use the compatible.
Is that an issue?

> 
> Best regards,
> Krzysztof

