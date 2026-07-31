Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0020B42F6E2
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508958; cv=none; b=SUKPo8AMaf2Z/Z3p++BRdHekiL1fVdbKTJ799tG5isF9EXM9xsdpTytEZH0KmSRd63QpKAs9GUz7qDLxJk/Fn2NQQVdgssbF7fSKzqQME4Xe8Ex9Zl+IDwYiVe67SBHsSGHw8rvdbmXKo4QtLEsN2YthwC+3MiIxdhu/WAVxw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508958; c=relaxed/simple;
	bh=tBo1pOIGLQzGzdk2QTAoCK07FNlt308/uZWd59j360w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBMLcfqibXiWSvZT3HMeN9dBeJUFiBkEDbAp1UAj+SLioIQG3JIjO7GAJXy7EMwxANPB/Qojlfx5KS6qcD4SEmokMYO3Pjem1svOfeKBM1/PCrC7vlu3Ibtnrzyc/coPF59CYJFU/JVL8oypnaA4smEjWtjAEmjFUk8AuGT5rec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/rNEoJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUKyaRd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/rNEoJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUKyaRd7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBcsR64185491
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=o/rNEoJ8Oye8yOuF
	zL6GwiazrXRPiI+uF8nuWoBzc0ZlBjPX+m3pwkU8aGZ46/XUJ/H4BikXVmcxx/8a
	jEJtTz8kgaAQeS52Zv/l9JSSCEbbIvhW0j9P8T9yJyvAMyqO/Z2DKI2wcD58YOx3
	CDUxaim7tmttEvgQKpkJ+bCJ78WZCo0NGeAdCJqqzPktw8/0P3PkedyWGrav8FLr
	0+K8G/YaIQWUya9VPJ1w7TXufpter81WjdDhCP5qMIpCgmDpbwL7IFglq6wc5Xwb
	KQSnDZbRiPz4YaR4NoBTXBLvXTCd8pbwGyHz/HmAOk9lp75Jk/3OuxBrdcGz0S1l
	1WSbdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru130s36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 14:42:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93105103d06so18939685a.2
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508955; x=1786113755; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=bUKyaRd7MDtVofN0i0REwmmKW7Mf+p50sQVPyJ5OHxlNR6/5swIPWwk6J5R11zBmyt
         kli5hoK6ig1SUCAe5wl7bnKzhF+N6ofwAgumKvpYqBLzAcPmjlwuoaMzz9O6jM/vhgWy
         aHu+mx6Gz5KM7iiUwoD7AGs1U/bTa7GFKdcul+MD2oA8oWWs8qa7eyHBFep5QZKPSPBD
         bOO4JuAZL/x2OvrT4UcY/ZjtaR+AFsqNkZF6vZ33aed52yVksYxeW7XkOYQmkAEDOdn8
         amJFmawAMluMAV9ZUJJj8cZyFyzuoxpL6TMh4AquEBQf13PnLjx1qJ0F5ocbL9ayJrZK
         r4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508955; x=1786113755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=mBDEPMOACiyVXjK9cjitTHQuzBOKSrRr6NB+1Zsz7Z6o1TWyIr4ESXsmIIQmKgYXea
         uxS7wxsVsW499GoC+CSvHoQVTeEHdmYQMCRI0mvmWGX8wFR6RHYMU2rmV5yS1nGkDdXT
         6SCzSlbUL+yTGj3eyI9EhyfGm1a7NXqAIFmUioRMLomZQygOr6QY4X7uwF2A3h8mGNko
         J1C0Ez0p0NH76uz5ARCQIIhL5b2rl8372pL3SViqghEydpfphXQZQTLrRDS9AkZTnTeE
         N7goX6jO3INQM4YvPqE4EevhH6p8sPxtZbs8PLL81zvbYMWsq9RaJlHeN9AUowFpj7Fo
         dCwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp86unyqjiJtLMU3UzGAdgzLvAvWIFIACtZUbQ7EZnVC3jDFtGwib1LNqpfXP97W9mVrQXM9qS90i7YtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIHG0LhyK4Bie8zTLWiCx4VPIBFaD/hai1gk/4fwA4q+lOcdoO
	YE6Duc7hxy6q7KEEIQG8FIB3ZiJIJ12oVcgYLjVFohNIFDI7fMdjhHS+ktgwokgbOj3U2Q16k79
	tzY24BQMbIWCEq3t+tyiqmmhigjMl79IX0x0jg+TW7xJnFkMIwXz7rnWYFv1cPyiswg==
X-Gm-Gg: AR+sD12ajYfMNdJzVsRMzHw+BWegziiowtQgLQcC4dOer8Nwfryr0RwlhgDEZ+7Rs5F
	ukCXsGjhp3g4Z1vIQ+LnGtB51wY8lEkFOPAz3Cit3qpBcvo7bCXvGsu6xDo2s7OZsW4lWP1G7xf
	kV73cKAClMPgdhROd9GXUhMcQjFZTIb9j3pj6nbEUZbDQCY8DlYcm06jtcKT9pnb09jwvV5n71R
	rQfRwNnzyTOWSPHinuJa50cA8e2uzgdC5iNO2Z3mD9Mmge5Mp+aV7TSM1uhYEFbgBeK9b4/DmMj
	J4F/u9dYR60/khs80Fy/l8ITdUzQVCHqTYzkQbOImaQ+8GJnMa8pf0jUFJAqTxEEAzZtUpOaRON
	hJa2oyqV7LjvAViCnySKs4tEU
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34875785a.1.1785508955198;
        Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34869985a.1.1785508954780;
        Fri, 31 Jul 2026 07:42:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e3a7dsm1541071fa.32.2026.07.31.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:42:33 -0700 (PDT)
Message-ID: <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:42:29 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721065413.2306137-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX0VILI7vca76T
 wr6ACspgpiVqVvgbWSqRE1e5DaubAX177U/w0Jx4oAgdxsCojpj4/cIxqaLhbuGw0RiNYEmSIjL
 DEScVkHNoJiOj68oGu8adY/fj4VUoCo=
X-Proofpoint-GUID: GaPScpFZ83pmOr5BM-l5gdqgVzWsPP9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX3JbwnZXq1lgF
 4OnaqIfmZIRyfr7kiSH+PErJpn5NroNdPRQtnpNHWSUTKSFsTwOjjTIFhH1PzmQeT+Ld7/xSFxf
 eOI0SjZGgH64nn0GtnvYBchLuoXIzXqc7fTw+oIHZYcLy3weZEs3a/i8COnLSkiASiDJzQEC6B2
 rI+KF/oEe/dvkRQcVuJw5ZHFZ4LAmi4b6rNcrFeyDVRGi6z2RzWoNmycnsJl7Wd54thpc36KuSY
 BqtJsZ94tWQ5dRlTg7xVAX11LzVcQEWq6XCcxhJ/Glard6UjPfO6pUHfymZWqF/ZJpoPnxkN1TK
 Zo6MOnKuxtEA4f1/K+TRs205UchKHvxLAy7y2QiazDIlxmK25zABHAUDbVQFO6b4BSXh2cFDJjp
 Lplm4/oRhBooXKTzezieg89tLEvPIHm3kl8ARMZ5SSw04e8Qttl9IDGnhsj7SWAOheCdUYla21e
 pBh7yjMH3W2UKVW8CuQ==
X-Proofpoint-ORIG-GUID: GaPScpFZ83pmOr5BM-l5gdqgVzWsPP9_
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6cb45b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=7ZmCE17i0x7kTLN8kT8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

[...]

> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(fwnode)) {
> +		struct fwnode_handle *port;
> +
> +		/*
> +		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
> +		 * or NULL. Passing NULL to device_set_node() clears any associated
> +		 * fwnode. It is effectively a no-op here, since no fwnode has been
> +		 * assigned to the newly created device yet.
> +		 */
> +		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);

This works if the node at the other end of the graph is a
USB hub, e.g. from qcom/lemans-evk.dts:

usb_hub_3_x: hub@2 {
	compatible = "usb5e3,625";
	reg = <2>;

	peer-hub = <&usb_hub_2_x>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@1 {
			reg = <1>;

			usb_hub_3_1: endpoint {
				remote-endpoint = <&hd3ss3220_1_out_ep>;
			};
		};

		port@4 {
			reg = <4>;

			usb_hub_3_4: endpoint {
			};
		};
	};
};

But something I faced when I was poking at USB4 was that dt-bindings
currently assume every controller is effectively single-port and the
of_graph ports under it represent HS/SS lanes, i.e. the entire
"ports" subnode represents a single USB port

I think the solution here would be to do ports {} under the controller
and have every one of them have 2 endpoints (for HS and SS
respectively) - then, each DT-port would correspond to a USB port
(sorta like in the hub case, minus the hubs are split for HS/SS so
they have just a single endpoint under each port)

But that comes with a big breakage, as always..

Konrad
