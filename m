Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65744226CFE
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851839; cv=none; b=jMuIuYf4Sht2g9NZ59RPONQgdVSI+aF/xibumWiFRAmVOELucbvWcXK9iOgG8YN9w0q+E7EVDi8ASUVyAUKKfMWl9GLxfic7QVFxQW3duFwaput2rpN5jTcZRI+TtHN4zZU9bB8xu9xx0fg0AxQk511MKM4AV8aBejYlEjTJTA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851839; c=relaxed/simple;
	bh=cNmiagvpItNjpR2jJijzr0scGysr1BHS9wTSy+mUF0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5dHshnfsZkV1sK2MRoYMRyAM4gMxM9yEAlRsVLi7hNStTl2AmOpMWeWYntufEYuGlX3Z6JOrSApDkzgg2P8iWdX/rcF1Ig6bsbBLM7qkZa+2AAZe9Z3P6gcEyy5Jg+qsIu5Tnp74t20lw0AfR37cXnChUheFBf37k1SyeucmTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+jKua1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdRbGMol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+jKua1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdRbGMol"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IG1TW24024046
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 16:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qko/YRXofL0g7xK31fRPrNzf
	jiKro7Z+in3JRlMOoE0=; b=S+jKua1ES82ossdgH1hPCw4HPR239ijv3WGXmk0p
	iN18XhT4T+64frVMobCY/kpiwPx9t7/a+5D7FynGCL33iokELy26eHx8U36fh7q+
	F6QKQYijdPZIcAyOAmqiGeZnwIOW96RO/YRVB4No6kPsg7c/RdxD/k9qOHaTQEku
	Ud0m+Uhfk5g/i8P8c4oDWXWXbWAP74ORPa13QkJRG2jhw0Qsc3ttNT40MwYzSngT
	4PLDmY+7RCPOm0e212i3Qv9D90S2hNah3VQg7TuhYOtw7UO1+8nRGDhCeJH3iOR7
	DxcSf1eNEa+fqwW7KVoTwwR6Ly/fUDVbza21Y1fnby4JNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75r580-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 16:37:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509162597f9so156505871cf.2
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773851835; x=1774456635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=;
        b=FdRbGMolqu4eY/G5obDwFVz4B2LTcp03wFX91cB7gFB5BOLiXBFFHB/jBtCG6cove/
         usFC7WK7OsqtUNUgnf9kRlp8wYsqe9C9pFfi5kRpCvb2b5uLLkZsGaugYQii3QdA0pj0
         I2OR8K0k4D0uaw3OV2mNu84WrdxJArspVXcJ6S56rfcvNbwyZHk38eLwotoOpX1PWOfe
         tZZPWIQs0x+cKi8rRf6lKSFpszh5YsiNZCQw1yGz67EnW6xMRzb7MFIPXyirygaspIZu
         0iT+zoMgocPXobKZfyOYJ/Pd+PyRL+NW65MTtkSOEX0ODss0H6q89ucTGFl1RE4nO64D
         y7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851835; x=1774456635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qko/YRXofL0g7xK31fRPrNzfjiKro7Z+in3JRlMOoE0=;
        b=gvbAoAu5m87DOWuKvnVma/racbAh/PycGK5yk/m+huZyxjjISfZSfswihg3wGeoZ8W
         Lvhx2nUXXcYzE80MP+iMYxOXpb+UNUtAM7RFnbJxdNzWMSk3flX1WswdKubOYaGKVyn9
         gzT1NStTs6/LbwxoI0SZxG/X6eL4cRt7yscB27MnOl7vyq2wQuK+i+TlVjlYn8k+kfFJ
         4UiS2D0jfKuKQhL5YUQu4govM0P2dFO14JM7h5YyLmWLq6tmX301m0g8oVXHisrz6rcC
         ibaRn0kcVKa8Oj5uADAJZCNgpvvQ5C2jVN9WIA1oOf6hRMUfdf08lAXLyMBuPlMMPH9z
         5h+w==
X-Forwarded-Encrypted: i=1; AJvYcCXWj70EXiYWsseWBw9EfFruDH2WoB0zugJlrbDyjDnqrEFSWwJhB3RboV2yqCz1LK4nKMaezSaWgO2jzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+3g8H/+Q6osxUol59qz+bTR1X1FaCfuN4Srm31gg/3s3sKaHX
	Hu8Gc5CiccaRniLSm649iXZXdyn2H+8e3EdoUqWiGS0c2zWR7gnbSsCVVKGC1Dw1u4zVtpUzzoc
	H4m57++gusi97Kg0ADQTLMzsHhSK4FCz05l98qDkLXYnQkVSKRR/FKWROblbEuYIxYw==
X-Gm-Gg: ATEYQzzY+4m49lLphbOZfQ9WPsaAs9iaBMl38xL+EbGbX0R76hffs55gaOdB1daIxa+
	96baOHuOrMEDHyQJ6etONp5VnKm+3PJMnGQU5GmwQqZi0rlRoa90teAVK3HdolvzL2TObCoZMHa
	wWDY4LYjhL5yn1xmaYXA+TV8UMOXzLQvACz+21vvysh1LY51RNLo1E2WVzqN5ZT1BZcMIMEuq5G
	Yc8fmAJzHt3W+d2wB5zMnQ8nkPXTvW9WMMad9QQDdYGz/4DqQGSa69uinbo2kwhLQKwkyeYTtJV
	X/kczWCATZ2a5z4NVvVpGaB2yX7Xjf/4E7l3N+1JUf5DtuQwNjnzz+RG+7QJBcJFoUSpmUBTj1t
	L+vA3MGtXBjFVMWGt91dSKwTHQN2zk/g64Q==
X-Received: by 2002:a05:622a:295:b0:509:2655:a95e with SMTP id d75a77b69052e-50b148b14e6mr50661631cf.62.1773851834659;
        Wed, 18 Mar 2026 09:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:509:2655:a95e with SMTP id d75a77b69052e-50b148b14e6mr50661201cf.62.1773851834101;
        Wed, 18 Mar 2026 09:37:14 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c53153sm2136765e9.13.2026.03.18.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:37:12 -0700 (PDT)
Date: Wed, 18 Mar 2026 18:37:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Message-ID: <sfo2ib7segaqnpzd3u22k42od5cp4mrz72h3nwp2ihrds7l7uk@6xvkvonk2sg4>
References: <20260212235842.85934-1-dakr@kernel.org>
 <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
 <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0MiBTYWx0ZWRfX7QU0FpIE8xwQ
 xNgVRR8hlimn4J/4Ks09yJxBsII300laBdQhFxV9a6ZyIRk7ZRoQdb8irkiRnvuMw6owVoQsix0
 YqQ3Jscr2SySBYTES3wwwDr4doTXxrV7txxaqri+HiBAIiT/avdY7reF3dS588GApP08WXas/Wt
 WF8R2KmLyTApE3eoYfBnUn/3+PSjJp4Oz0umjGrWa2BkVBmfsU5uTCZsv1Em9jIYauED0qxmpqp
 nbmPrY/iU4II2xIqpP5yBL5JzPHehC/4nVzr0O3RTvMgBNQwzQSZUtLmhSMVhh2q138I5WyNer7
 AdVUXzyb1eax4FY1aFpGr+ZhjgzyALz53IqstKFs676z7rVWjeOvhNl/GQxGRvXubLgf1urx70e
 mjD/hF/dOhkIr6lezq23W4hsDhGtYZWqJa+LWYLcU24ONMSZ8C55tjURqUOYonCXgZSb7XyLuSC
 6Oy5b6ZNPt5oFNmpGNQ==
X-Proofpoint-ORIG-GUID: jks7yzI2YDsuPUsfzasKWTfI60iUVv-1
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bad4bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=CELFId4UG5F86OlxqCwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: jks7yzI2YDsuPUsfzasKWTfI60iUVv-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180142

On 26-03-18 16:42:49, Danilo Krummrich wrote:
> On Wed Mar 18, 2026 at 4:39 PM CET, Abel Vesa wrote:
> >
> > On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> >> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> >> called from IMX driver's probe() callbacks.
> >> 
> >> However, it neither makes sense to register drivers from probe()
> >> callbacks of other drivers, nor does the driver core allow registering
> >> drivers with a device lock already being held.
> >> 
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/1] clk: scu/imx8qxp: do not register driver in probe()
> >       commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9
> 
> This is already in Linus' tree, you gave your ACK in [1] for me to take it
> through the driver-core tree.

Will drop from my tree then. Sorry about that.

Thanks for pointing this out.
