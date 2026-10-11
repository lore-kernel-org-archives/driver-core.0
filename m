Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3CC44CF52
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728260; cv=none; b=HAoaXs8quKOKqGvJ3jyXGGN50fP99bOoSzEK6c0lfk3q769gv6SeYF7IuXny1duamDnwAEaNLvNpt4xURooYT14iSVgGRS9JqWkkXysfN6z64MQvkNqbeCn7JbqwixjxZV9eyNxgICvG2mbL+h1NItry12DHtC9Ss577jc2uReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728260; c=relaxed/simple;
	bh=QhE1BI0sOXWtBfGC0rLmez15LhvXAeMMSv4ir+L+uY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nm37exVKVI8RqaIPXoDwzFooSQpTDvco8eyuIbzPP9DLtd0eZAVyM5QGFSqQ2NNBPbJxssgUiYkuPXF97jVUV0D3vkbTGzTraeE3tMiA7Bm7E+q+rjq1H/tNW5EVNsx6BNdeyREA8TiK0PvChgLs4GyIHpsnl13gIqAb19QpXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ew42wOJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hf7kfdbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ew42wOJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hf7kfdbW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85bmg1514096
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 14:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOLlwEieA5QUKwTZQoQXtWGYO+pXqkTk6kdhFCGgK5o=; b=ew42wOJOzPyztr3x
	ChIgXlUghIxqXBsi11pHHtKtPtR5lT62wzz9ZgdfT3NwVY1L5ggkTJu4Ex0bL2lI
	TNq1uW69IZIG9AuEj+3Ke5PgdgRB6XPVeE6gQBQFwf+Z/SiyvCyjPGuU4zz/Fp30
	ad8RFlKtis6fTOyoQ6kjDd5xKYwOHm/pdUo0VmZgKwK7q9fD0WblQ+aOK5bKMSLm
	GPWey2G7GuYO6N8mk3lABgf/cUprk4N+vSd8t7LlzX9iDFC/F2olLI45TfCB+m1d
	dJZLuQ7Ifh7acoiS/wsJ0ppFi+1OSGMMkCF5hTMhfmNAke/R46DmXgjpabPuiTPB
	LSJ8NQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjk1u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 14:17:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so861063a91.1
        for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 07:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791728257; x=1792333057; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOLlwEieA5QUKwTZQoQXtWGYO+pXqkTk6kdhFCGgK5o=;
        b=Hf7kfdbW5OL4oue+q0OKyaaaGIJVBDXkaKDlPnbiKQ0RrBlDU9AGn3iiEoAX5UxoFI
         aSbK0yRT+zUCwrrBtz53hRPAHLfTQFO2SQn5i3UALpQviGTvChVCmZpfm41AhRALJAzd
         YBJCylWoSUL71iWGst5GnhNxq/umJYLoDQztV5V1Biyx2ua4iI2ynOwDhmTVQYPX9gm0
         8Sx+U8vzZsYpLFGZA634boacjddrrWVnMRYf9V+WEOfhd0Q3sSYB5VZ4idpTYVZQNXEt
         /H+3n1PzqZmQmWmV03DgOTst+Oh6suH3bCSN+K/xhXGGeF7l5s+bGP71p9JXqIr5WSLV
         tTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728257; x=1792333057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOLlwEieA5QUKwTZQoQXtWGYO+pXqkTk6kdhFCGgK5o=;
        b=Q47IyDvgOQyg5FhoOeT5UkYDUUc6Crm/2UwrP6AJlwgxUkfAi6/Q+JijlejM7NHnaN
         RhD/lM6V77VvXPdx+iWgP3INeHtmFT6GEOahKVvVO+aYcdxleTwLn6LNKJh54FQ3U22M
         oQF+MWvBA5fdng3h9SN77KnDigTgELcSYOSmxco9f793vj/a1tmG67hh3zy9+KtQXzx2
         rvCMvZ3wjr+iwv/42cQs3nJf/gW2SjtCCeonovBxB3emC7eizx9DX53OViLmxO/XxRPl
         cdbcTasfV07VwFlIHvJSWGOUXgwLaF6iZRrdfmTnvyKTrnumrNb9Y5qt+GeHs57SPC7n
         CT4A==
X-Forwarded-Encrypted: i=1; AKwUvBwT/wudntWs3LB0Ofr5UdtpWvdlhAY23qxX9kJDS7DxmmdzGeQ/xtCDG3klA2rDTVJ236UsPyNijozXHQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKbp2NyguQu0FLDyTFuHnhC5sALBQpweQWfJH3z+aEsRXJjUo6l
	NCzxZvt4yf0+iWaXNMoDFAsPOBWTKN55QWr2qyfvan6F1S8fYIaunQ/hFRaw4Lddr8zM91U8v+P
	14owBtZeo93zW5AHfvfJgqkglQg8Vfd/498D01R2PonWIXv4Dr/XMmzFI/SXssIpnRA==
X-Gm-Gg: AYBFou3zehCBi/ZAYWuJSZREKU0Yh8QHT8dqZ3AV8QARGiAz1gQil1VPueSuTB686pc
	Uf+TA96LY+UwElSDCeHoQp3ZIYiHwCzT09CUrYiIVXyQ4pfqg1k4FXqT/3WcjJcrKrYG2/ig+MS
	Evbu/VzqLkDXs5AsFwBOKuTORs6QUZgg3CIsi5zBBmKBa75nTBPPADKj6oR+fpA8DjB8KwfPtsu
	IVw3qq2/uaVZzCAfUQGfj+YbkqByE9GwMIhVL27dZj8OXRgUj97BmAAWgk/CvnHtaAIJdv8mMpy
	VDzc39sJ4KaW5Ozym7RhSTTxJpFBjojBpZ8RJ0Y+f7HoMaYSuKnYQmbMI94If5nCf3Z0BGATKAD
	f1IcCgBhZda4yBfXuEr/O/avqJuw3fZ9tT2EYKJ4EcaeRLlFmGbR5BZexPw/QOXs=
X-Received: by 2002:a17:90b:4a8f:b0:3a6:e985:5631 with SMTP id 98e67ed59e1d1-3ab3a99b88emr6463611a91.62.1791728257101;
        Sun, 11 Oct 2026 07:17:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:3a6:e985:5631 with SMTP id 98e67ed59e1d1-3ab3a99b88emr6463585a91.62.1791728256511;
        Sun, 11 Oct 2026 07:17:36 -0700 (PDT)
Received: from ?IPV6:240e:400:e20:12c6:a578:1ef6:8335:64b6? ([240e:400:e20:12c6:a578:1ef6:8335:64b6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e21db1sm3375013a12.16.2026.10.11.07.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:17:35 -0700 (PDT)
Message-ID: <41f328b2-0825-4023-b86c-48136ba6ecd2@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 22:17:14 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to non-boost
 freq on boost disable
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>, zhongqiu.han@oss.qualcomm.com
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1NiBTYWx0ZWRfX/aYWbOZY3q97
 2O/Kglq8PND3aHOo9tDwdFtSHmcC5l5vLq2FBa3uCwqIqGmDCue0y8YkgS1gbAgC/CkdelEAKe3
 sOrk+dYrSYOt77dnEG8F9lZRVncEwuQGaazTGF1awYXgHuclo35jthlc+GxrJAu5xF587wfMbg9
 6YT561/LgC21WUYISzMctBQnInPADWwgPS62YCxU92JeV7EXsCBA04Ajjgv9bLsepZha5VUfZPX
 LDQWFoH9nnqTdzEBKMiw0gzR3XjRhX25pP4AWuitj7sHgIjkD8gahteLrBti47gZyBZo5cFEw11
 1VHv5Nb3aMPQUfUwDDdN7B8lVicm2FTm1SHYccHaoHxXJQbrnCzdpYM6p0jkVXyLf/A+a+Qkvun
 jeR6CE1k5wtx78SF/mJfIEileHxrAjlSRCSnmvP3tJM11NbiFHWJVtrsD3vHvMKXN+DWtsUwFkB
 7JPj8paBvmhjkszCA/Q==
X-Proofpoint-ORIG-GUID: 2G3uCfNGWHCLPeSUOH1W3kEi-3bM3Cqf
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acb9a82 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=szoK_18ZvN8xkPl22oQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2G3uCfNGWHCLPeSUOH1W3kEi-3bM3Cqf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1NiBTYWx0ZWRfX+51EvbHtdVcy
 Qohu7A7SFNnrVKPxJarXkNsF23mWd4oTeoxKGVaWovdrZBmqTjnivaH66ivexNKORow59Tx4IQ8
 0Bywt5Tle0mRA0WbV3Xh2sKIHZ9ART0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110056

On 9/29/2026 7:38 PM, Ananthu C V wrote:
> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> max boost is known") introduced a guard for cpuinfo max updates to only
> increase, to preserve driver-set values above the freq table maximum.

I think as discussed in v2 the changelog should describe the impact of
commit 6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS request"), since
it is relevant to understanding this fix.

> Later commit db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
> init") dropped the 'policy->max = max_freq' assignment from
> cpufreq_frequency_table_cpuinfo, leaving that one-way-guard to be the only
> path for cpuinfo max and consequently policy max to be updated, causing
> both values to be stuck at boost frequency even when boost is disabled.
> 
> Unconditionally track the highest non-boost frequency (max_base_freq)
> in the freq table. If boost frequencies are available, use the highest
> frequency from the table/max_base_freq instead of cpuinfo->max_freq to
> control boost values, so the value can decrease again when boost is
> disabled.
> 
> Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")

Patch 2/2 currently depends on a helper introduced by patch 1/2, which
prevents it from being backported independently. Since 2/2 is an
independent fix that should be backported to stable on its own, I think
it should be placed before patch 1/2 in the series and kept self
contained.

> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>   drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
>   drivers/cpufreq/freq_table.c |  9 ++++++++-
>   include/linux/cpufreq.h      |  3 +++
>   3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 96515880b4ac..5e6afb6f8826 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -574,6 +574,8 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
>   
>   static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>   {
> +	unsigned int max_freq;
> +	unsigned int max_table_freq;
>   	int ret;
>   
>   	if (policy->boost_enabled == enable)
> @@ -587,7 +589,19 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>   		return ret;
>   	}
>   
> -	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> +	max_table_freq = cpufreq_frequency_table_max(policy);
> +
> +	if (policy_has_boost_freq(policy)) {
> +		max_freq = enable ? max_table_freq : policy->cpuinfo.max_base_freq;
> +
> +		if (!max_freq)
> +			/* when the freq table contains only boost frequencies */
> +			max_freq = max_table_freq;
> +	} else {
> +		max_freq = policy->cpuinfo.max_freq;
> +	}
> +
> +	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
>   	if (ret < 0) {
>   		policy->boost_enabled = !policy->boost_enabled;
>   		cpufreq_driver->set_boost(policy, policy->boost_enabled);
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index ea994647abc8..820ed4559f6c 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -14,7 +14,7 @@
>    *                     FREQUENCY TABLE HELPERS                       *
>    *********************************************************************/
>   
> -static bool policy_has_boost_freq(struct cpufreq_policy *policy)
> +bool policy_has_boost_freq(struct cpufreq_policy *policy)
>   {
>   	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>   
> @@ -27,17 +27,22 @@ static bool policy_has_boost_freq(struct cpufreq_policy *policy)
>   
>   	return false;
>   }
> +EXPORT_SYMBOL_GPL(policy_has_boost_freq);
>   
>   int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   {
>   	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>   	unsigned int min_freq = ~0;
>   	unsigned int max_freq = 0;
> +	unsigned int max_base_freq = 0;
>   	unsigned int freq, i;
>   
>   	cpufreq_for_each_valid_entry_idx(pos, table, i) {
>   		freq = pos->frequency;
>   
> +		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
> +			max_base_freq = freq;
> +
>   		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>   		    && (pos->flags & CPUFREQ_BOOST_FREQ))
>   			continue;
> @@ -57,6 +62,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   	if (policy->cpuinfo.max_freq < max_freq)
>   		policy->cpuinfo.max_freq = max_freq;
>   
> +	policy->cpuinfo.max_base_freq = max_base_freq;
> +
>   	if (min_freq == ~0)
>   		return -EINVAL;
>   	else
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index f048c925fd98..7bb58405e004 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
>   struct cpufreq_cpuinfo {
>   	unsigned int		max_freq;
>   	unsigned int		min_freq;
> +	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */


To avoid introducing a new member that is only used by frequency-table
drivers, please consider the following implementation instead:

If there are boost entries in the frequency table, the table is the only
source of cpuinfo.max_freq, so let cpufreq_frequency_table_cpuinfo() set
it unconditionally in that case.


diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ea99464..8c8bad2 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -33,14 +33,17 @@ int cpufreq_frequency_table_cpuinfo(struct 
cpufreq_policy *policy)
  	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
  	unsigned int min_freq = ~0;
  	unsigned int max_freq = 0;
+	bool has_boost = false;
  	unsigned int freq, i;

  	cpufreq_for_each_valid_entry_idx(pos, table, i) {
  		freq = pos->frequency;

-		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
-		    && (pos->flags & CPUFREQ_BOOST_FREQ))
-			continue;
+		if (pos->flags & CPUFREQ_BOOST_FREQ) {
+			has_boost = true;
+			if (!cpufreq_boost_enabled() || !policy->boost_enabled)
+				continue;
+		}

  		pr_debug("table entry %u: %u kHz\n", i, freq);
  		if (freq < min_freq)
@@ -50,17 +53,20 @@ int cpufreq_frequency_table_cpuinfo(struct 
cpufreq_policy *policy)
  	}

  	policy->cpuinfo.min_freq = min_freq;
+
+	if (min_freq == ~0)
+		return -EINVAL;
+
  	/*
  	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
-	 * it as is.
+	 * it as is.  This does not apply to tables with boost entries, because
+	 * the table is the only source of cpuinfo.max_freq then and it needs
+	 * to go down again when boost is disabled.
  	 */
-	if (policy->cpuinfo.max_freq < max_freq)
+	if (has_boost || policy->cpuinfo.max_freq < max_freq)
  		policy->cpuinfo.max_freq = max_freq;

-	if (min_freq == ~0)
-		return -EINVAL;
-	else
-		return 0;
+	return 0;
  }

  int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy)


>   
>   	/* in 10^(-9) s = nanoseconds */
>   	unsigned int		transition_latency;
> @@ -791,6 +792,8 @@ struct cpufreq_frequency_table {
>   
>   int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy);
>   
> +bool policy_has_boost_freq(struct cpufreq_policy *policy);
> +
>   int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy);
>   
>   int cpufreq_generic_frequency_table_verify(struct cpufreq_policy_data *policy);
> 


-- 
Thx and BRs,
Zhongqiu Han
