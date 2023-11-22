Return-Path: <linux-samsung-soc+bounces-75-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE4F7F4926
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 15:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0381C20BC8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 14:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D00B4D101;
	Wed, 22 Nov 2023 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="x7SQ/I1H"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958C1C1;
	Wed, 22 Nov 2023 06:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1700664166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9l7CzXN6LlS38rZFFq0Nxp8PK7NYDm9aN5Wn+Z/Buw=;
	b=x7SQ/I1HOiWc0cwQ6er9JxVxd2di1ktX2ld6tiwKekdklOtdP54pycvx1s1KAVhfCqW8l6
	t/Y88WRMV20TDY6M4PWiDDHKuWXTh/o5K/9QKplNCSBk0NkOuo8ZkUqFO2cDjC4v3QNQuU
	BwShho8epg3KI/PenQJo79YnPUu+R5FsDbEhsGaGkkCZXxko8ucAKfY1trKhy7YQjxBAL4
	BTtM9VWeoaMsWlb7MqndqTur+5yM39vgYLrKyvgk/hsyd6RN8H5cQz82mq6Shd+ZQfQnTj
	GkqNjDCurBsMM2KsjG+Z6g7/s3ejsd+j727Gtm81FLFE0bqKtMSaw+fL3L7cqg==
Date: Wed, 22 Nov 2023 15:42:46 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, wens@kernel.org, =?UTF-8?Q?Rafa?=
 =?UTF-8?Q?=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof Johansson
 <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
In-Reply-To: <CAL_JsqKkOjBHrJ0WELq3JnJDqgtA=mdF+EtAxHSCGqZMQ9tuSQ@mail.gmail.com>
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
 <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
 <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
 <58a9caacc1226c7c3a2bdfe73ef1791f@manjaro.org>
 <cc4c789c-b595-41eb-b543-9e03549c6e61@amd.com>
 <CAMuHMdWm-gRPHeHyuX3_eR+9chJEw3iiZwCNBnoiRPHzoMAs6w@mail.gmail.com>
 <808270d3-2274-4fb7-a397-38538503b67c@amd.com>
 <CAL_JsqKkOjBHrJ0WELq3JnJDqgtA=mdF+EtAxHSCGqZMQ9tuSQ@mail.gmail.com>
Message-ID: <f9dcdd519c0bbd29838a75113fef0645@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2023-11-22 15:34, Rob Herring wrote:
> On Wed, Nov 22, 2023 at 1:57 AM Michal Simek <michal.simek@amd.com> 
> wrote:
>> On 11/22/23 09:53, Geert Uytterhoeven wrote:
>> > On Wed, Nov 22, 2023 at 9:50 AM Michal Simek <michal.simek@amd.com> wrote:
>> >> On 11/22/23 09:29, Dragan Simic wrote:
>> >>> On 2023-11-22 09:21, Krzysztof Kozlowski wrote:
>> >>>> On 22/11/2023 09:09, Chen-Yu Tsai wrote:
>> >>>>> On Wed, Nov 22, 2023 at 4:05 PM Krzysztof Kozlowski
>> >>>>> <krzysztof.kozlowski@linaro.org> wrote:
>> >>>>>>
>> >>>>>> On 21/11/2023 14:50, Rafał Miłecki wrote:
>> >>>>>>>> +Order of Properties in Device Node
>> >>>>>>>> +----------------------------------
>> >>>>>>>> +
>> >>>>>>>> +Following order of properties in device nodes is preferred:
>> >>>>>>>> +
>> >>>>>>>> +1. compatible
>> >>>>>>>> +2. reg
>> >>>>>>>> +3. ranges
>> >>>>>>>> +4. Standard/common properties (defined by common bindings, e.g. without
>> >>>>>>>> +   vendor-prefixes)
>> >>>>>>>> +5. Vendor-specific properties
>> >>>>>>>> +6. status (if applicable)
>> >>>>>>>> +7. Child nodes, where each node is preceded with a blank line
>> >>>>>>>> +
>> >>>>>>>> +The "status" property is by default "okay", thus it can be omitted.
>> >>>>>>>
>> >>>>>>> I think it would really help to include position of #address-cells and
>> >>>>>>> #size-cells here. In some files I saw them above "compatible" that seems
>> >>>>>>> unintuitive. Some prefer putting them at end which I think makes sense
>> >>>>>>> as they affect children nodes.
>> >>>>>>>
>> >>>>>>> Whatever you choose it'd be just nice to have things consistent.
>> >>>>>>
>> >>>>>> This is a standard/common property, thus it goes to (4) above.
>> >>>>>
>> >>>>> It's probably a mix, but AFAIK a lot of the device trees in tree have
>> >>>>> #*-cells after "status". In some cases they are added in the board
>> >>>>> .dts files, not the chip/module .dtsi files.
>> >>>>
>> >>>> Existing DTS is not a good example :)
>> >>>>
>> >>>>>
>> >>>>> +1 that it makes sense at the end as they affect child nodes.
>> >>>>
>> >>>> I still insist that status must be the last, because:
>> >>>> 1. Many SoC nodes have address/size cells but do not have any children
>> >>>> (I2C, SPI), so we put useless information at the end.
>> >>>> 2. Status should be the final information to say whether the node is
>> >>>> ready or is not. I read the node, check properties and then look at the end:
>> >>>> a. Lack of status means it is ready.
>> >>>> b. status=disabled means device still needs board resources/customization
>> >>>
>> >>> I agree with the "status" belonging to the very end, because it's both logical
>> >>> and much more readable.  Also, "status" is expected to be modified in the
>> >>> dependent DT files, which makes it kind of volatile and even more deserving to
>> >>> be placed last.
>> >>
>> >> I am just curious if having status property at the end won't affect
>> >> execution/boot up time. Not sure how it is done in Linux but in U-Boot at least
>> >> (we want to have DTs in sync between Linux and U-Boot) of_find_property is
>> >> pretty much big loop over all properties. And status property defined at the end
>> >> means going over all of them to find it out to if device is present.
>> >> Not sure if Linux works in the same way but at least of_get_property is done in
>> >> the same way.
>> >
>> > As the default is "okay", you have to loop over all properties anyway.
>> 
>> No doubt if you don't define status property that you need to loop 
>> over all of
>> them. We normally describe the whole SOC with pretty much all IPs 
>> status =
>> disabled and then in board file we are changing it to okay based on 
>> what it is
>> actually wired out.
>> It means on our systems all nodes have status properties. If you have 
>> it at
>> first you don't need to go over all.
> 
> Order in the source and order in the OS are independent. If checking
> status needs to be optimized, then we could just put it first in the
> property list or make the state a field in struct device_node. But
> provide some data that it matters first.

That's exactly what I plan to do, i.e. to perform some benchmarks before 
and after, to see does it actually matter to the point where introducing 
the changes is worth it.

> I've had this idea to randomize the order nodes are processed so
> there's no reliance on the DT order. Maybe I need the same on
> properties...

