Return-Path: <linux-samsung-soc+bounces-7242-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25225A4E440
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 16:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5CAE17F0C4
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC38293B5D;
	Tue,  4 Mar 2025 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbA7VZDt"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3027FE6E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102175; cv=fail; b=I8goHZi1ZZTkY090KBAxAQZhgg/M+ol84SZspTlJRUQCfH7s7anQEDxCO0ygvvOkEj5e59IsEvXAxSQcnVW/3VZcGMDCLfzfh5dXlHrn+wxjUZq34nW9vPJ1BxavqeBDJfF9DfGZnHHEV4Ls9bX0y9lI92nD5KuLMN71MEaLRd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102175; c=relaxed/simple;
	bh=U1cpx2HHWKwAOOaL+2CmA6qqaiQQdSvmtVx7NrQM/Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3x9WlpdY5BAJ6n8MXrZkugX1AZgxyPR/7tc/t3IKrIBPXYGMdfJAoxCFG4ZWyXlQQED2saFESmq68ng2qeNLOQBJKdDjlRPqSvIUo4ttX7lS6ZxAL31o5+WVqxy0vlQPRjOsmHhkiiHUttZoMOtctnXU3uNfH0z2a8oIIAYSMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbA7VZDt reason="signature verification failed"; arc=none smtp.client-ip=10.30.226.201; arc=fail smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 6855E40D5700
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 18:29:32 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6ffl373QzG0P0
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 18:26:39 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 35E2442731; Tue,  4 Mar 2025 18:26:25 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbA7VZDt
X-Envelope-From: <linux-kernel+bounces-541089-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbA7VZDt
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 71E6642305
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:24:39 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 0F1BD3063EFE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:24:38 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 275423AFD82
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA931EB18B;
	Mon,  3 Mar 2025 07:24:24 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1212B93;
	Mon,  3 Mar 2025 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986661; cv=none; b=rFLgIQ3ah9Y7hYb3lLbMin1wESpjKObR/m/kH9WKOzEMfMivM7FHp2W45S4zlGhzpSYShJn6Px/pNdrtBvGyxnc2tu6xX7z9w0pCgSqhybtb9EaHJDvFjDBpMQrH8VwXTOK7L0lHIgQgRfeFrVUalwBrL/m7x16bC8wJRONaC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986661; c=relaxed/simple;
	bh=VySOvvJYVOXMBNDZlPELZwP+g8cJ/Y6sF/YKn/PvvDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efDOi8jLCCqIst4DrtXOy3L7IUWSRDOo0StuYP0ZQDPXXYIKTfZM/eK81y/+wATf/QcglUGlo5og35yxW5o1OJE5V+882EBN/mZ7g0o4hFvvEyffyBhs727MKNMBdxYVtm1377dU1oWNSYw0JFBaEv6VbHzUFulYUxCsa5PP0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbA7VZDt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB72C4CED6;
	Mon,  3 Mar 2025 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740986660;
	bh=VySOvvJYVOXMBNDZlPELZwP+g8cJ/Y6sF/YKn/PvvDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HbA7VZDtl/TNWqG62oFhLMl+naJrz6RHcKCe2eecOjSTmvNSgowWBBPxsqrF0Xutl
	 Dh+A/xjoB+v7Ap3lvHzUuCe135CCplLe/N1S07bo2GYI6gkcl1AMINuRjrRBxE5//N
	 j9I48zLi8ourbw6TRjONfcLqJdrhGI03lmYfyk0cy6xI9QGn6ituRFuS2RzH2yBl7b
	 WWcnGOrM78y2AmOp5XWTzwjEhwuBAXYPo9EIBdC4yIS+8lfVThl/2HnWcYCR8N2m3t
	 PyiITAnhBIZMCHJYkm99gtdy4ktesE9VcdxGvtqjWuJHQg7BI1X7JHUT+QqLIyL5K7
	 OfjucJD27eRog==
Message-ID: <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
Date: Mon, 3 Mar 2025 08:24:13 +0100
Precedence: bulk
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6ffl373QzG0P0
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741706881.07677@BDYYr1QKTISsP4X3AdGf8A
X-ITU-MailScanner-SpamCheck: not spam

On 02/03/2025 10:16, Ivaylo Ivanov wrote:
> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>> intermediary between a USB controller (typically DWC3) and other PH=
Ys
>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>
>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>> ---
>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++=
++++
>>>>>  1 file changed, 76 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,e=
xynos2200-usbcon-phy.yaml
>>>> You have undocumented dependencies which prevent merging this file.
>>>> First, dependencies have to be clearly expressed.
>>> They are, in the cover letter.
>> Where? I read it twice. Dependencies is the most important thing and
>> should scream at beginning of the cover letter, so if you bury them
>> somewhere deep it also would not matter - just like they were missing.
>>
>>>> Second, you should
>>>> rather decouple the code from header dependencies, otherwise this ca=
nnot
>>>> be merged for current release (just use clocks with long names, with=
out IDs).
>>> Sure
>>
>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos22=
00-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos=
2200-usbcon-phy.yaml
>>>>> new file mode 100644
>>>>> index 000000000..7d879ec8b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbc=
on-phy.yaml
>>>>> @@ -0,0 +1,76 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-p=
hy.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Exynos2200 USB controller PHY
>>>>> +
>>>>> +maintainers:
>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>> +
>>>>> +description:
>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB c=
ontroller
>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>> It's not (I think). There's a few reasons I've decided to make this s=
eparate
>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>
>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tu=
ning
>> USBDRD phy does not provide UTMI and PIPE on its own either if you loo=
k
>> at diagram - they call it phy controller.
>=20
> Ughm. What? So in most exynos cases, there's a combination of multiple =
phys?


>=20
>>
>>> for them, and all that is needed from it is to disable HWACG, assert/
>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>> initialization can be done and USB2 works. If the USBCON phy is not s=
et
>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>> attaching/deattaching and then initialize the synopsys USBDP combophy=

