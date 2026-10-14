Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4D549391
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987664; cv=none; b=tICrMv5KMAdr+VsBCmsS/sfe+t5PN7O9+hnvaMwoGvqVxqxs1d56eQ+L4Ecsrlkn5odwJQJuFZpcXwqPnlkBoNAWyrcvr9tvJed463J72bcPKn1LspSVpMBCVLsK5GR6K8e7kOGE5RihA6nXYlUTrzO1rWWbjAKPTAhD+6ffClg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987664; c=relaxed/simple;
	bh=XGNrFoZ7MV8C7/dY+VSILAwCYiTvCmyJQJRuuRE54UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eubxf+XNs17lVrkm5/g8KiO//MHvtDf33WLbDzZCeo4uo6ruDQUMjYzL42yPxo6T2L8NS/JOeAR2rQtf+U8vD7V49/TdyYlKT8mYkBuMkbaL3TaJo2tVcjf8C+pvmzXj0wV2HqE1y10rbeRfZg+75I+7LqFaU4Rlxm7I2hcE+j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQsQ3V2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qon/bOAJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQsQ3V2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qon/bOAJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARD9c466360
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=; b=XQsQ3V2+7aeVELol
	Ty82a8+AuF1t9jlkHQFWPGqV0R1T/GK+hcYNI/jB/xE2U98nVKQjh5LTXxgH9Z/p
	vXORGa0AWtbQzyGpze8vXqeSkm/EQSTQUBEDHb4PIce784LMrvhQQisXC/+VrQg1
	uqEXXg1kM64HJJ0Vb6vywpDypIJZ+5ofYbMUUCa6vkaVMV+zhIRGXm+OyNQMYJmA
	tdBDVH3qrmhCc5rDyyGwV2XdSDQ5DWw1QXD1+5F3vt9ggiq/cVRAAQ17B2qEVMLj
	3RbBcP91MMTjRXH7h8bYm0/ezdrYQmBFfkFgDhiK2OgCf5/fzf4oytw483Dyw4iM
	FYpRpg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80crvvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:21:01 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e95e7cc02fso76256e0c.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987661; x=1792592461; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=Qon/bOAJDJCwy54ZnekqeSHEnzzfCMKvpVqgeDXs7b0Cp6XBb4HrpRk9vGFMgvcgKE
         xzI7jizpl1XRj4Us8MiNx7lZ8y7eUp3Akhgl2qyAmf3r7a/1Vd5B3GBR5GFipVqPKQ8L
         FAl17xQIxyp0wSxOzULlLqiC0ckwBNCu80zmyMgzxABD7/jnBYOOWB6uTjdHvOJ4j58Q
         TY0X5qiDdCuB4THJpZAhGwvSxxJKCKV3bvATJr6RkaY7vsIdGa3pX6WMURpWB6cuqlW/
         8gXlbkIZJ83sqVHdtYLXNHYYoC7/QsgjSJf59GmXTgDQCTR0G0PqrLNaKzKIVUuf62qn
         +SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987661; x=1792592461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=hHmRlCXSRFHlLboFDNckHJVo21lj+dIZF1UYvxz8j8AO2zdAWsqS32Ox7i9WHAgxLf
         1o5dOHL1R2K1V6axPhJGUJGqw1sRW73N58snGBIgv36ZmEismIMw0LMFUy6ov04IfKu0
         9m0t+Z3swvi22Mip43LH0yDHfxzvgSkJWeai/tx+WZAOZuvM1/eKofXOFTma8D5sd2Yj
         fwYbmhbzbA3EcpZaHhv/QhWjl+a7cyjTVLcXi4EIzHqMUlnappVNSH44omeXFgIV01ie
         IndkXULQ/YWsLE6fxhNQY1YlEXjWjg7MmlVFw32IkbtMpYo/zEirsX8RVQHVwckHyPvp
         t29w==
X-Forwarded-Encrypted: i=1; AKwUvByj93WT4jZKeeiyQFhjwSsLARWi6msYLEJhYhuF3ky3eMQR6rQjAVVlDsI1RsoGTKY1SO/ACRNEZxVBGw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIs7RERg18Zi98NqluNtxpH0b7K0wKaFCeJQedd8TbpGO4ihvi9
	XFOaLlVqBKxJaRJJVMFU/s9C3qgukK2/P5oWNQqc32+BeNcWxc9+MLacPwqwx0LxR1Of5ogH8Ow
	Kp4Ym8+Lz73yLuwOOEPMRjhEo7MNx7DBb02pqjrY6O0N9WIwX2wQMCeITnbmsB4ZggQ==
X-Gm-Gg: AYBFou1hV4uFXftUuNq9CyTUpGktxYFNCIjquc9/HXm2EZK0KsIfcf0d1tyytLzMvBz
	1YESBDFq5xTw8aQX4Icec8pGTT8cRk2U8RmGA+00m241inwUCN2p02bcBOa7nxEDMmBfJpYGLTS
	+3HcwNiJp1WUqefAiMVx7BlmZi6fFiJ7zmHAZIcW0PuWsc61ozjZskuZQpmJh+PBVxHSWb7p+7p
	vHNAtfwGvIt2a48v2UIIQ13TKxvHpKn8zbxQ9XJxntJFq8R9N7GVqhPJj7d4wZU9gKbPDECtAai
	LKdAZd2E0Uq80lVq9L+lHPjZ4Q4BNWENA7dK4Xxe3EcO1jMnWsbDivuPyv0o0S9agGTHP3azOWk
	LpSs+wGLk+BlBHpv1Wh6mig==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157610e0c.3.1791987660489;
        Wed, 14 Oct 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157584e0c.3.1791987659925;
        Wed, 14 Oct 2026 07:20:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388ad72sm1182036a12.24.2026.10.14.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:57 -0700 (PDT)
Message-ID: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:54 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX0zIKBP7wsvfC
 hUdX3ZW0EUR3e2Jm25XffOtBZQsz3eOfe24KOXrM2I6rwzDK5FbNniuxunMgtf+F0rsluo7a/k9
 WfaxfQKK9sztpSuHHK8sE8PQhchWHq0=
X-Proofpoint-GUID: pe5HO-hQlt5lzMashispEL3RBlv8nIHB
X-Proofpoint-ORIG-GUID: pe5HO-hQlt5lzMashispEL3RBlv8nIHB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX+z2RZWvKFvs2
 GjXOqN6wcZv0KcVAlwp9Fj4j+6UgSF1+DFEHbrY7kDBB7UnBKfbj/PTw292OL/K9IHYiffGdAhp
 jgtqe3hKthY0KyZU46jEEy5cJUdvHqX15qkGULYeQv6Mbr0PQkI6b3NQGj2ga7S1xRH5zCbx+0C
 zrb75b7jal6Qqq0/pG9H1Sb2pTzu7j4mSQOTLUt8EW4giz61WlLYaws0BkvWWlfHG0pGY6XNhOu
 pfMMBp45WAZwX5/LcIUZJcqdo4jKLrI8QZwqLHmp9MvgSulhQofPvqtogNx9BY6Ury/oH1z34ut
 Egqiv02dbF6iuxWaAUpPEDWKW32NXJcJye5SyPYRSC+ji4oRmNn9dedJsAkGfs/xlq9cSQ2/SU5
 BG4zb5SE5MD8SEh06LRmUaeXcdnY2TVYRxylDrjEJ2c3M8gSIo5i0aZ5sbUpfEh0H1K7swy5asU
 f079fl1b0tyggHVNlMQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf8fcd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NbljYO6N7a6c2dGYBmcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Clock controller power-domain attachments currently become parents of all
>> top-level GDSCs exported by that controller. This conflates resources
>> needed to access or operate the controller with actual power-collapse
>> hierarchy.
>>
>> Allow callers of gdsc_register() to suppress parents inferred from the
>> controller device and its attached domain list.
> 
> I think, each GDSC has a parent (in the hardware). If we don't represent
> it in practice, we likely need to fix that.

The next patch allows setting a precise set of parents instead. Perhaps
this commit message could be improved.

Konrad
