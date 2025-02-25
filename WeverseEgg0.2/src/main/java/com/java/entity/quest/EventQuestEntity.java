package com.java.entity.quest;

import com.java.entity.item.ItemEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Egg_Event_Quest")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EventQuestEntity {

    /** 이벤트 퀘스트 고유번호 (Primary Key) */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "event_quest_id")
    private int eventQuestId;

    /** 이벤트 보상 아이템 (FK) */
    @ManyToOne
    @JoinColumn(name = "reward_item_id", referencedColumnName = "item_id")
    private ItemEntity rewardItem;

    /** 연관된 퀘스트 (FK) */
    @ManyToOne
    @JoinColumn(name = "quest_id", referencedColumnName = "quest_id")
    private QuestEntity quest;
}