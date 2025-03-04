Return-Path: <linux-samsung-soc+bounces-7234-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863AA4D4C1
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 08:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CCD4167828
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 07:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B011F5826;
	Tue,  4 Mar 2025 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf+R5WqR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFB91F3B8B;
	Tue,  4 Mar 2025 07:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741072907; cv=none; b=fXZsK9VVfCQx+2hGHIxfBe2UprZg3nYJhEoOFDul+5wKUdehXOpn0GEIfdVEKhfrKegESQ+XaHAvCWGgb/GqNrWYmtk590mFEXnzgRA9wLXXgxXcCCZoOo4/c24wg8JsJGvq2f/w83OxnaHFnqpBPWLiL92sqOGrYQfqTjg2Yqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741072907; c=relaxed/simple;
	bh=T+fpq98v9Io2vg6grazANB67VEQzov3KO4PYt35Zncc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjFNBJjbu42AyNvZBBgptt0KBjQ/0pie3LR6NeJiNtZs+iVgqfa4oZmRdZtpt4o3mTEeFtXNRrg6jE4x6GyxKw2090/4a1bMC3wNbhpMkTD+4WqK3EFHduoVe87E/BO8gFRuNVMWS/YBH2XTj4FZbcqqCbeFVA38laudy1DBGKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf+R5WqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A282C4CEE5;
	Tue,  4 Mar 2025 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741072907;
	bh=T+fpq98v9Io2vg6grazANB67VEQzov3KO4PYt35Zncc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yf+R5WqRepIcAvZ0HF6I5wGDmnXfpZN204rxo1N9Cqt/9SU8s3VbtY93qZD7FUGKt
	 eI07SN7t/gHc7+jUs1R26VuP09pN/FGi+ADxk81G6G4BwfsMbcWSY6IyKvkq/O5ZuA
	 qZOn/yvo3HZDyvUwVMExev+0fhu6fQqujTm9pKl8JQiw2Trjf4jKdCQEuSLkdWIvYT
	 A2XRwRgsh25MyUpfL1Qw1CVW++u0ioWKJZ8018iyZjt2fmFRdAJJnaQN4oO+aRUna6
	 ucfo7qh4KQrybYXT5sFFfPZ/WCN1w6b9Qk4/wdjgcvACUdHpHkyPHhltTM+hZFXgmc
	 X2COYGMKRAghg==
Message-ID: <027decb4-3fa9-40a5-9cf4-65f9a69b4566@kernel.org>
Date: Tue, 4 Mar 2025 08:21:39 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
 <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
 <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
 <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
 <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
 <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
 <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2025 18:18, Ivaylo Ivanov wrote:
> On 3/3/25 09:24, Krzysztof Kozlowski wrote:
>> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>>
>>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>> ---
>>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>>  1 file changed, 76 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>> You have undocumented dependencies which prevent merging this file.
>>>>>> First, dependencies have to be clearly expressed.
>>>>> They are, in the cover letter.
>>>> Where? I read it twice. Dependencies is the most important thing and
>>>> should scream at beginning of the cover letter, so if you bury them
>>>> somewhere deep it also would not matter - just like they were missing.
>>>>
>>>>>> Second, you should
>>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>>> Sure
>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000..7d879ec8b
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>> @@ -0,0 +1,76 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Exynos2200 USB controller PHY
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>>
>>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>>> at diagram - they call it phy controller.
>>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>>
>>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>>> Does it mean there is no USB DRD phy controller as before?
>>>>
>>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>>> So...
>>>
>>> DWC3 -> USBDRD (USBCON) -> PHYs?
>> No, drop last phy. You just wrote the same as me - two phys, because
>> usbdrd is the phy. In all existing designs there is no such controllable
>> object from the point of view of operating system.
> 
> What? Per my understanding, the phy property should refer to whatever is
> is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
> usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
> that has to be connected to something, doesn't that mean we have clearly

The entire point is that eUSB2 is connected to DWC3, no? That's exactly
how it is done for example on Qualcomm SoC. Otherwise you claim that
DWC3 controls one phy, which controls another phy which controls UTMI...

> separated hardware blocks? Now, I guess one could argue that this USBCON
> hardware block could be classified as a syscon. But I don't see the problem
> with the current binding description, nor the modelling, as it represents
> how the hardware is (unless I've gotten it completely wrong).

It is the first time you use argument that it represents how the
hardware is and this is what we actually disagree. It is not like that.
You do not have chain of phys. Just look at any USB 3.0 DRD DWC diagram
from any Samsung SoC: where would you squeeze these two phys in relation
to what is called there "USB 3.0 PHY" which would be the third phy (!!!).

Best regards,
Krzysztof

