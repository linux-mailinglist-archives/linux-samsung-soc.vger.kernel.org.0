Return-Path: <linux-samsung-soc+bounces-383-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517F803A03
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Dec 2023 17:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5BF11C20B1B
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Dec 2023 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6E12D7A5;
	Mon,  4 Dec 2023 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="e7yB0UOW"
X-Original-To: linux-samsung-soc@vger.kernel.org
X-Greylist: delayed 72460 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Dec 2023 08:20:06 PST
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D68795;
	Mon,  4 Dec 2023 08:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1701706804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ei0AfrTxppCNJPpWkXUKHARQoDXVj01I/xt3XpEpDOk=;
	b=e7yB0UOWUQ5vZJkft/UZvLG3evjPAYjr3Uk+dlKW13a90dCPz/oxZdtsKFSaX9nFPSr+Kh
	lHEMlx8BB58c4hJTORW1x3K/7rewGccMmgPWUMos+5MiBnCainQsrMzdJlsaFZudAv7np/
	5NKkLKPzBdaOJ+vHgicel+QjKNdYjmWmMRQfDFKhlauhnZCprP2Fq//K0YGxH93S7+uCqw
	MXmHvj/18GgnvCc2bSrcJbklJFOVakITZ6e9ewkM89wSSuFKvlmA30Q1pnSWYFOv6HAaCm
	Bl/OSfOPXYoPAZf8V5GHAKAMbb32bRCc3nQ6JIk5rqYVlurldeZWyphu2p7azw==
Date: Mon, 04 Dec 2023 17:19:59 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
 <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof
 Johansson <olof@lixom.net>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <zajec5@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
In-Reply-To: <95bb3618-496d-4b55-a2f7-1b4200cbe420@linaro.org>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <63ec18b2758a9e385f446fb00b60ee69@manjaro.org>
 <0bcc0679-b883-4435-8843-cc830122c0e1@linaro.org>
 <83b413441a953e8f2bc56adf09511a80@manjaro.org>
 <7021717e2e747b9c119b7c5091b60bdf@manjaro.org>
 <95bb3618-496d-4b55-a2f7-1b4200cbe420@linaro.org>
Message-ID: <619db272718a608ac211266aa2fd05aa@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2023-12-04 16:11, Krzysztof Kozlowski wrote:
> On 03/12/2023 21:12, Dragan Simic wrote:
>> Just a brief reminder about my suggestions below, which seemingly 
>> didn't
>> find their way into the v4.  At least the first one, which improves 
>> the
>> opening sentence, is worth including, IMHO.
>> 
> 
> I applied almost all your suggestions, except few which I disagreed 
> with
> in my replies.

Sure, but I got no response from you after I replied and offered 
different versions of the few suggestions you disagreed with.  I mean, 
none of those are too important, except the one about the opening 
sentence, which is currently a bit awkward, so it might be good to have 
it improved as suggested.  It's the opening sentence after all. :)

