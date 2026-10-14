Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D4548578
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988581; cv=none; b=UqAoTJsztAG/rMx8RpmXWeVaXcViHHmo81WkwNWs0QEiGwtOLqOgfGR7DYuoRFT0FnCKBVUH8N/xOhhqfiOocmHMe6B/k1fvYQicay1ula8qR/m01kh7EKYTCB4fVFK+tBffDe2ZH+3IJiQs+IwK9OtK7MxtfWc3LwAdRG8d67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988581; c=relaxed/simple;
	bh=mzjBXcJwvR3mP2wpzKXtsjTiclq7JD/M2/04w4VLf5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MevtMciOGDNjlv6ZjdPPZzgXUq7bojrQKHFOGA2RFHYtJ+13FIMxiHkDqfVJbgCIlz8O0cL2cd1kMF0dROBM5JbkrXg8uSPSlas3B9Cux/Mar8uMcm6JJ+bU85xH9NCoZds5/6iiZeNXFHF0J36HRKXoSCAhXEd5xz5anjlTgPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJhECvj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XL3CDstb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJhECvj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XL3CDstb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDD1RO3017572
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wgur4uSx3uLBl1Y0UpHJoHojhBmbV96MGZDODwsBCDA=; b=VJhECvj+L28mtg+k
	MmSqpEXHqDbPRKqYUSNS5w9vXh3JGbNqggR0zZSGcn9cuYnsc7D+HwaeS6pGNTx7
	gP0GO8NHzYpu4aSvB9qsTAXwjJN5ZFS/UN1OEilxzMhBjRLrQVyn2oDDRwzECQlh
	sXLmb+tqFI0SezlBoSuH6bpPiaotaY0Nn0Cz/sH8IyvsrwAAfWpoVxRdcCj8DSmd
	RaUrOT2UPnYVWRBVEJ7KEvJytkq7TWM2mWg7JwxcoMnNKed8KHutCld3tkFd6k+r
	bxNM5/Xl8MydXr5PIMULFe/3dXQEzxE25yGqzPvuK3H2nWRXlZ8u1AS3uo0qw/UZ
	X0LQXA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4t71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:36:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e705718bebso139398e0c.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988576; x=1792593376; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgur4uSx3uLBl1Y0UpHJoHojhBmbV96MGZDODwsBCDA=;
        b=XL3CDstb1gWSxL7HPomi8YCN9NAiqmV34VFuNQi/dBd3DLuCnj7uDcDS5cr/eAnhXB
         PBJzEZMjESuEdh+SG/se7+4n9BzGepakkMjRNJ/f49uO4ta/TQAeVquhUgPe5+lPKZIP
         E0JX3u70CY6u2MezriCOyFbnmqCWeFicxakSv/FfoPzaRLDZkXGJQsHwDBm/mhM3tIab
         pP+vFawPC3NMIKL4ce0KAHjoIcHujeTWJsytIhYOYtO1j3+t/912UFIg9ABcHHiiIHRg
         tNsn4wS8OJIXbrmB0/8QdEX84ETMf6c5hZqQPg2JMvvFHlFJHkulxq43q2JuUUaCP4mN
         F+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988576; x=1792593376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wgur4uSx3uLBl1Y0UpHJoHojhBmbV96MGZDODwsBCDA=;
        b=LNolN0mhNA9L+cCNfRaIiv+7lAW1heREZZ38VpJtE3Z8SUx1MkZQqM1HnAw42t+vqk
         cU9Swd0lxzUOJSC+YNqsP79fa41acMLj04qk5sipdrwTkhFozDus/4bKI+Z0dds4VhrP
         BVovyJieDjANfEEagV5450wnHFbo/lRVc4HM1on8LjNGqWtI5Tg0f/H2iJen+Cc99nE3
         xog+ZZfIjbAaYj+079F6wvgyx0DTlqyk1pFjUL80JyAc/s1+jzRbRnLT6gFZOTFU2RZW
         0vO8t1DkpTdtPb0UZZ8XNOXtRLngYAvOKHXN2Ozqzf0BNVlESjw2oC/0gTkmad7Pju62
         ltvg==
X-Forwarded-Encrypted: i=1; AKwUvByFaOZqtbVtTutuuEZynebnmpJ/TpbQjTcTBL9bYIjJwqbR67lz81w90duQ9uOSMn5bs7DTiiiSCEDYyg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0Ue6QU3+2EYPCKnQSigwo/Ju0nk0CKg9gJmq9tuDdSmESlJ/0
	DaA+Xi0w2u7wJixoPVhTIvCfNzb7oSmZ6cRy18bXXLOhpVSgnecd7N52iW1bVjDYAEBRZyBC8EO
	eF+tBgHQG46ZW/+GrRx0TudTT1q9XhgdWK1BeW7+2DKG7epqFRX3pstXAHj4N46ND+Q==
X-Gm-Gg: AYBFou2n1fFNiic5SsfrtTuLy8seZZU9IS0bp0BhfJe32OarPWr0AwaJw8tSTSmv13I
	FZN+zEMeE1PJvn6AF6sdTlI95GHbzZctaTSuAL56K3R65rX2KrdwrTkty3ZwIpVw9nZ1wA8cIgG
	niRqqFJHWF0MhylOy18nwYQuvqlgt0YvzddMmjuJKtWihWpoLKZg1n0K7LhXYmvbpGslAzWQ/Pa
	uEmLpr23kqAgV3z/1W/vGti1Fx4CZWIDVwG4DMwFX08jBp47NDeuOW/qmBj4qvUJApFW6+xQ1V5
	+nyyh1NzNaLT8LlRr44Wmsw5B9/VGGmgbv9EzzldbAqZROWyOP3e3wat7mt4luBl3/TUp5IZjlC
	eaDGmU9jUc0STxrbBwaGRAw==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1774552e0c.4.1791988576395;
        Wed, 14 Oct 2026 07:36:16 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1774536e0c.4.1791988575925;
        Wed, 14 Oct 2026 07:36:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm1288926a12.11.2026.10.14.07.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:36:14 -0700 (PDT)
Message-ID: <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:36:11 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
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
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf9361 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7Nn-sgJJM4qzZjt7KU4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: cj43QHgibEMgw-7zHeYQ3I6M_3zYlE7g
X-Proofpoint-ORIG-GUID: cj43QHgibEMgw-7zHeYQ3I6M_3zYlE7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX1UNv1DzOsOQs
 mUuXr3+o4hy2LeQ1A94aJA/CX8/FtbKJRicWNP9r6NWBFCfl5n0dfc5XDrqeM8tlurSdGHF+qAB
 nznlZL/772ekxkjbsNzx2PGpGj7QjpE+zBmn4y+Bxw8LdlcvQvWjDmSZFoONRTm5Vdl1lLPcyx3
 EbtM3fG8fMoX6FgCR5vkM2aILWGPmmb8qyLZKL4acjEBjUpT1MjEfOv9H7p7NHEFLWTxBLIPOZw
 5boJp8O+Xc0Y1amdH+xwQ9vq9UF83eGeCDN+sb6kKE//YCvhv3ZuYbOhhAjkdUdE3jqoLW+Coab
 H0MgUNs0krHjn7l6gq1RT6cNEGEJrarczzimDI5ssWBQ/Cs1n6UjPwqIa1TSUFQQ2sU3CkG7IZA
 5uYdSJ/aSuJ9hTE7eegqvY+exBAUkrVG0+h/gx5t10fL+nvJG0ImcTY4W8RYYlBe/co/8y5dQfB
 wJcohJxfHmqQNBVkjWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX5A7jdaoY76fa
 bXDa9q6sWuY0Jl9XYJpWJ59947H1d+AeYO8PdACalrM190EdPz4JyYEajoBMlJ27Jy1FR9smCLF
 A2apC4DZN1irIw2/lwk9sHSzi5mZ8fQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The SM8650 clock-controller nodes omit rails needed by their clocks and
>>>> PLLs. Without those connections, the clock-owned DVFS implementation
>>>> cannot attach its voters to all required domains and controller probe
>>>> can fail before any clocks are registered.
>>>>
>>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>>>> Assisted-by: LLM
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
>>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>>
>>>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>>>>  				 <0>, /* dp3 */
>>>>  				 <0>;
>>>>  
>>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>>> -			required-opps = <&rpmhpd_opp_low_svs>;
>>>
>>> I think this is neccessary (at least on some platforms) to keep MMCX out
>>> of retention. Even if we can drop it here, I don't think we can drop it
>>> for older platforms.
>>
>> MMCX exists precisely to let you turn it off, the clock patches
>> retain a way to keep the clock on during the runtime-resume of
>> the clock controller driver
> 
> Turning off MMCX is possible together with suspending the dispcc. If
> dispcc is resumed, MMCX should be at least low_svs. On some platforms
> it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
> On other platforms MMCX lists 'RET' as a possible value, however it's
> not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
> exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
> represent it.

Retention isn't a ""real"" state the OS should vote for, as the HW
downstream of the rails generally needs some flavor of LOW_SVS to
function, or at least I don't know of any such cases.

See also

7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

Konrad
