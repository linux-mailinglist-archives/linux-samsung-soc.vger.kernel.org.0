Return-Path: <linux-samsung-soc+bounces-236-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C8A7FD48D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 11:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9733F1C21162
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 10:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5A91426D;
	Wed, 29 Nov 2023 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vn80LgiN"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95C010D3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Nov 2023 02:43:28 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a00cbb83c80so898366766b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Nov 2023 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701254607; x=1701859407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVLky8Z20SSO+CvYldXW9t2l0cWtn7iQRH4AeA4Nat4=;
        b=vn80LgiNk3jpiDvd9eWAq9svPjZkf0cVIUJskvJBKRpitKdaGNh2xGY4aLTVvcj9m0
         sbqzrW1vyzJJUa0iqXpVKTNFR3k+WhnGagmk+OpoBRkar4uA4bXowX3IjGjyPgSgI10M
         tLTSfMJhdYhPNZhceBxhlxeS8KmNbJH3QN9nK4OX0+DaDGkIsHQcKHPq6ZzcqdVxdQt+
         cdfYBom27BO3PNO9H1EBYSnpMo4GxryIC4U9F7JPjltjI9MU4Idkh2PO838fvauhURNC
         aVRyzO0RcSb9aQUa03/VeKaFU0EBsxt6mLA3XWO7mJOs7SE6LnBFWfNjSdwwHauoJPl1
         t7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701254607; x=1701859407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVLky8Z20SSO+CvYldXW9t2l0cWtn7iQRH4AeA4Nat4=;
        b=LOXOAq2zbNx5Fk8yX1kAnYin9twa7vVlcksspAnmt4Cqhmg+9LvdqHA4DgrhTAn65l
         Yil77N1HXpUZ2GRlWtTStfvRj8HLLg+wK19QW5rDhuu9Fpzs7Ga7f5JcBnFIZg5ZRIXd
         G0aTYcBUmj3g/+3+RR77TicrmBkXymx4TuQu1vaHqskWjT5OI2VMQdIjDaEgQ4N8kXzx
         N96qKTCLvILqGAXk/vCbZIZyO3435kd9r2IC911lCfvbdBNWwuzXu9OBCiAENo9PQ/pn
         c8Nn6TZ0kf9KpuPLEwg4cepsmgMzwSjmUp1E4Svc80VKRQXxT4V0ttYZFyKoKmYrlovG
         CdLg==
X-Gm-Message-State: AOJu0YzIEdUAWdP2N8EHy6u58GlZG83hJvE5fphV40VsJrIIJZYoI4dG
	uHJpMzhqSe8lnPc0LeFErvqDJQ==
X-Google-Smtp-Source: AGHT+IE8QHGn91DGeLLSv5/Szy3YvAtLEG1epfKY3EEMbOEyvG5igTHKUH33mvcN+IPmY4o0Tr2rmw==
X-Received: by 2002:a17:906:c307:b0:9d4:2080:61dc with SMTP id s7-20020a170906c30700b009d4208061dcmr14414319ejz.22.1701254607098;
        Wed, 29 Nov 2023 02:43:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906348100b009de3641d538sm7741813ejb.134.2023.11.29.02.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 02:43:26 -0800 (PST)
Message-ID: <0bcc0679-b883-4435-8843-cc830122c0e1@linaro.org>
Date: Wed, 29 Nov 2023 11:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <63ec18b2758a9e385f446fb00b60ee69@manjaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <63ec18b2758a9e385f446fb00b60ee69@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 21:00, Dragan Simic wrote:
>> 5. Allow two style of ordering overrides in board DTS: alphabetically 
>> or
>>    by order of DTSI (Rob).
>> 6. I did not incorporate feedback about, due to lack of consensus and 
>> my
>>    disagreement:
>>    a. SoM being DTS without DTSI in "Organizing DTSI and DTS"
> 
> I went through the language of the entire patch, after the notice that 
> the v4 would no longer accept language improvements.  My wording- and 
> grammar-related suggestions are available inline below.

Thanks. I want to finish this at some point and it might not happen if
grammar fixes will be coming every patch revision. Then after we finish
review, new feedback will appear about using British or American
spelling (which reminds me old quote/email about which variant of
English is most popular in Linux kernel: the incorrect one).

> 
>> Changes in v2
>> =============
>> 1. Hopefully incorporate entire feedback from comments:
>> a. Fix \ { => / { (Rob)
>> b. Name: dts-coding-style (Rob)
>> c. Exceptions for ordering nodes by name for Renesas and pinctrl 
>> (Geert,
>>    Konrad)
>> d. Ordering properties by common/vendor (Rob)
>> e. Array entries in <> (Rob)
>>
>> 2. New chapter: Organizing DTSI and DTS
>>
>> 3. Several grammar fixes (missing articles)
>>
>> Cc: linux-rockchip@lists.infradead.org
>> Cc: linux-mediatek@lists.infradead.org
>> Cc: linux-samsung-soc@vger.kernel.org
>> Cc: linux-amlogic@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: workflows@vger.kernel.org
>> Cc: linux-doc@vger.kernel.org
>> ---
>>  .../devicetree/bindings/dts-coding-style.rst  | 194 ++++++++++++++++++
>>  Documentation/devicetree/bindings/index.rst   |   1 +
>>  2 files changed, 195 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/dts-coding-style.rst
>>
>> diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst
>> b/Documentation/devicetree/bindings/dts-coding-style.rst
>> new file mode 100644
>> index 000000000000..e374bec0f555
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst
>> @@ -0,0 +1,194 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. _dtscodingstyle:
>> +
>> +=====================================
>> +Devicetree Sources (DTS) Coding Style
>> +=====================================
>> +
>> +When writing Devicetree Sources (DTS) please observe below guidelines. 
>>  They
> 
> The sentence above should be replaced with: "The following guidelines 
> are to be followed when writing Devicetree Source (DTS) files."

Are you sure? It's passive and I was taught it is discouraged for
writing. See for example:
https://www.hamilton.edu/academics/centers/writing/seven-sins-of-writing/1

> 
>> +should be considered complementary to any rules expressed already in 
>> Devicetree
>> +Specification and dtc compiler (including W=1 and W=2 builds).
> 
> A definite article ("the") should be added before "Devicetree 

ack

> Specification" and "dtc".  Also, "Specification" in "Devicetree 
> Specification" should be capitalized.

It was.


> 
>> +
>> +Individual architectures and sub-architectures can add additional 
>> rules, making
>> +the style stricter.
> 
> "Sub-architectures" should be replaced with "subarchitectures".  "Can 

A hint, you can write such review feedback as:
s/sub-architectures/subarchitectures/

BTW, my language spelling points "subarchitectures" as mistake, but
sure, ack.

> add" should be replaced with "can define".   "Style" should be replaced 
> with "coding style".

ack

> 
>> +
>> +Naming and Valid Characters
>> +---------------------------
>> +
>> +Devicetree specification allows broader range of characters in node 
>> and
>> +property names, but for code readability the choice shall be narrowed.
> 
> The definite article ("the") should be added before "Devicetree 
> Specification", and "specification" should be capitalised.  As already 
> suggested, "broader range" should be replaced with "a broad range".  
> "But for code readability the choice shall be narrowed" should be 
> replaced with "but this coding style narrows the range down to achieve 
> better code readability".

Ack

> 
>> +
>> +1. Node and property names are allowed to use only:
> 
> "Are allowed to" should be replaced with "can".  After "only", "the 
> following characters" should be added.

ack

> 
>> +
>> +   * lowercase characters: [a-z]
>> +   * digits: [0-9]
>> +   * dash: -
> 
> List items should be capitalized, i.e. "Lowercase characters" should be 
> used instead of "lowercase characters", etc.

ack

> 
>> +
>> +2. Labels are allowed to use only:
> 
> "Are allowed to" should be replaced with "can".  After "only", "the 
> following characters" should be added.
> 
ack

>> +
>> +   * lowercase characters: [a-z]
>> +   * digits: [0-9]
>> +   * underscore: _
> 
> List items should be capitalized, i.e. "Lowercase characters" should be 
> used instead of "lowercase characters", etc.
> 

ack

>> +
>> +3. Unit addresses shall use lowercase hex, without leading zeros 
>> (padding).
> 
> "Lowercase hex" should be replaced with "lowercase hexadecimal digits".
> 
>> +
>> +4. Hex values in properties, e.g. "reg", shall use lowercase hex.  The 
>> address
>> +   part can be padded with leading zeros.
> 
> "Hex values" should be replaced with "Hexadecimal values".  "Lowercase 
> hex" should be replaced with "lowercase hexadecimal digits".

ack, but that's quite picky. We are (software) engineers so we are
supposed to know the slang.

> 
>> +
>> +Example::
>> +
>> +	gpi_dma2: dma-controller@800000 {
>> +		compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
>> +		reg = <0x0 0x00800000 0x0 0x60000>;
>> +	}
>> +
>> +Order of Nodes
>> +--------------
>> +
>> +1. Nodes within any bus, thus using unit addresses for children, shall 
>> be
> 
> "Within" should be replaced "on".

ack

> 
>> +   ordered incrementally by unit address.
> 
> Should be replaced with "ordered by unit address in ascending order".

ack

> 
>> +   Alternatively for some sub-architectures, nodes of the same type 
>> can be
>> +   grouped together (e.g. all I2C controllers one after another even 
>> if this
>> +   breaks unit address ordering).
> 
> "Sub-architectures" should be replaced with "subarchitectures".  The 
> "(e.g. ...)" form should be replaced with ", e.g. ...".

ack

> 
>> +
>> +2. Nodes without unit addresses shall be ordered alpha-numerically by 
>> the node
>> +   name.  For a few types of nodes, they can be ordered by the main 
>> property
>> +   (e.g. pin configuration states ordered by value of "pins" 
>> property).
> 
> "Alpha-numerically" should be replaced with "alphabetically".  

Are you sure? Does alphabetical order include numbers?

> "Types of 
> nodes" should be replaced with "node types".  The "(e.g. ...)" form 
> should be replaced with ", e.g. ...".

ack

> 
>> +
>> +3. When extending nodes in the board DTS via &label, the entries shall 
>> be
>> +   ordered either alpha-numerically or by keeping the order from DTSI 
>> (choice
>> +   depending on sub-architecture).
> 
> "Alpha-numerically" should be replaced with "alphabetically".  

Similar concern

> "Sub-architecture" should be replaced with "subarchitecture".  "(Choice 
> depending on sub-architecture)" should be replaced with ", where the 
> choice depends on the subarchitecture".

ack

> 
>> +
>> +Above ordering rules are easy to enforce during review, reduce chances 
>> of
>> +conflicts for simultaneous additions (new nodes) to a file and help in
>> +navigating through the DTS source.
> 
> "Above" should be replaced with "The above-described".  "(New nodes)" 
> should be replaced with "of new nodes".


ack

> 
>> +
>> +Example::
>> +
>> +	/* SoC DTSI */
>> +
>> +	/ {
>> +		cpus {
>> +			/* ... */
>> +		};
>> +
>> +		psci {
>> +			/* ... */
>> +		};
>> +
>> +		soc@ {
>> +			dma: dma-controller@10000 {
>> +				/* ... */
>> +			};
>> +
>> +			clk: clock-controller@80000 {
>> +				/* ... */
>> +			};
>> +		};
>> +	};
>> +
>> +	/* Board DTS - alphabetical order */
>> +
>> +	&clk {
>> +		/* ... */
>> +	};
>> +
>> +	&dma {
>> +		/* ... */
>> +	};
>> +
>> +	/* Board DTS - alternative order, keep as DTSI */
>> +
>> +	&dma {
>> +		/* ... */
>> +	};
>> +
>> +	&clk {
>> +		/* ... */
>> +	};
>> +
>> +Order of Properties in Device Node
>> +----------------------------------
>> +
>> +Following order of properties in device nodes is preferred:
> 
> "Following" should be replaced with "The following".

ack

> 
>> +
>> +1. compatible
>> +2. reg
>> +3. ranges
>> +4. Standard/common properties (defined by common bindings, e.g. 
>> without
>> +   vendor-prefixes)
>> +5. Vendor-specific properties
>> +6. status (if applicable)
>> +7. Child nodes, where each node is preceded with a blank line
>> +
>> +The "status" property is by default "okay", thus it can be omitted.
>> +
>> +Above order follows approach:
> 
> The last sentence should be replaced with "The above-described ordering 
> follows this approach:".

ack

> 
>> +
>> +1. Most important properties start the node: compatible then bus 
>> addressing to
>> +   match unit address.
>> +2. Each node will have common properties in similar place.
>> +3. Status is the last information to annotate that device node is or 
>> is not
>> +   finished (board resources are needed).
>> +
>> +Example::
>> +
>> +	/* SoC DTSI */
>> +
>> +	device_node: device-class@6789abc {
>> +		compatible = "vendor,device";
>> +		reg = <0x0 0x06789abc 0x0 0xa123>;
>> +		ranges = <0x0 0x0 0x06789abc 0x1000>;
>> +		#dma-cells = <1>;
>> +		clocks = <&clock_controller 0>, <&clock_controller 1>;
>> +		clock-names = "bus", "host";
>> +		vendor,custom-property = <2>;
>> +		status = "disabled";
>> +
>> +		child_node: child-class@100 {
>> +			reg = <0x100 0x200>;
>> +			/* ... */
>> +		};
>> +	};
>> +
>> +	/* Board DTS */
>> +
>> +	&device_node {
>> +		vdd-supply = <&board_vreg1>;
>> +		status = "okay";
>> +	}
>> +
>> +Indentation
>> +-----------
>> +
>> +1. Use indentation according to :ref:`codingstyle`.
>> +2. For arrays spanning across lines, it is preferred to align the 
>> continued
>> +   entries with opening < from the first line.
>> +3. Each entry in arrays with multiple cells (e.g. "reg" with two IO 
>> addresses)
>> +   shall be enclosed in <>.
> 
> The "(e.g. ...)" form should be replaced with ", e.g. ...,".

ack

> 
>> +
>> +Example::
>> +
>> +	thermal-sensor@c271000 {
>> +		compatible = "qcom,sm8550-tsens", "qcom,tsens-v2";
>> +		reg = <0x0 0x0c271000 0x0 0x1000>,
>> +		      <0x0 0x0c222000 0x0 0x1000>;
>> +	};
>> +
>> +Organizing DTSI and DTS
>> +-----------------------
>> +
>> +The DTSI and DTS files shall be organized in a way representing the 
>> common
>> +(and re-usable) parts of the hardware.  Typically this means 
>> organizing DTSI
> 
> The "(and re-usable)" form should be replaced with ", reusable".  "The 
> hardware" should be replaced with "hardware".  A comma should be added 
> after "Typically".

ack

> 
>> +and DTS files into several files:
>> +
>> +1. DTSI with contents of the entire SoC (without nodes for hardware 
>> not present
>> +   on the SoC).
>> +2. If applicable: DTSI with common or re-usable parts of the hardware 
>> (e.g.
>> +   entire System-on-Module).
>> +3. DTS representing the board.
> 
> The "(...)" forms should be replaced with ", ...".  Periods at the ends 
> of list items should be deleted, because those aren't real, complete 
> sentences.

ack

> 
>> +
>> +Hardware components which are present on the board shall be placed in 
>> the
> 
> "Which" should be replaced with "that".

ack

> 
>> +board DTS, not in the SoC or SoM DTSI.  A partial exception is a 
>> common
>> +external reference SoC-input clock, which could be coded as a 
>> fixed-clock in
> 
> "SoC-input" should be replaced with "SoC input".

ack, thanks!

Best regards,
Krzysztof


